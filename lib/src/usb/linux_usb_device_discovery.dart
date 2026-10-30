import 'dart:io';

import 'usb_device.dart';
import 'usb_device_discovery.dart';

/// Reads the kernel's USB sysfs entries without inventing data.
///
/// Linux exposes USB identities through `/sys/bus/usb/devices`. Storage
/// capacity and mount paths are deliberately omitted because they belong to
/// block devices, not USB device nodes, and require a separate policy.
class LinuxUsbDeviceDiscovery implements UsbDeviceDiscovery {
  const LinuxUsbDeviceDiscovery({this.sysfsRoot = '/sys/bus/usb/devices'});

  final String sysfsRoot;

  @override
  Future<List<UsbDevice>> listDevices() async {
    final root = Directory(sysfsRoot);
    if (!await root.exists()) return const <UsbDevice>[];

    final devices = <UsbDevice>[];
    await for (final entry in root.list(followLinks: false)) {
      if (entry is! Directory) continue;
      final vendor = await _readHex(entry, 'idVendor');
      final product = await _readHex(entry, 'idProduct');
      if (vendor == null || product == null) continue;
      final name =
          (await _read(entry, 'product')) ?? entry.uri.pathSegments.last;
      final serial = await _read(entry, 'serial');
      devices.add(
        UsbDevice(
          id: entry.path,
          name: name,
          path: entry.path,
          vendorId: vendor,
          productId: product,
          serialNumber: serial,
        ),
      );
    }
    devices.sort((a, b) => a.id.compareTo(b.id));
    return devices;
  }

  Future<String?> _read(Directory directory, String file) async {
    try {
      final value = (await File(
        '${directory.path}/$file',
      ).readAsString()).trim();
      return value.isEmpty ? null : value;
    } on FileSystemException {
      return null;
    }
  }

  Future<int?> _readHex(Directory directory, String file) async {
    final value = await _read(directory, file);
    return value == null ? null : int.tryParse(value, radix: 16);
  }
}
