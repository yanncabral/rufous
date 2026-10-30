import 'usb_device.dart';

/// Provides the USB devices currently visible to the host.
abstract interface class UsbDeviceDiscovery {
  Future<List<UsbDevice>> listDevices();
}

/// Used where Rufous does not yet have a safe native implementation.
class UnsupportedUsbDeviceDiscovery implements UsbDeviceDiscovery {
  const UnsupportedUsbDeviceDiscovery(this.platform);

  final String platform;

  @override
  Future<List<UsbDevice>> listDevices() async => const <UsbDevice>[];
}
