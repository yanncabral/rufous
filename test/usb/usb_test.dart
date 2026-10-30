import 'package:flutter_test/flutter_test.dart';
import 'package:rufus/usb.dart';

void main() {
  test('UsbDevice compares all exposed fields', () {
    const first = UsbDevice(
      id: 'id',
      name: 'Disk',
      path: '/dev/sda',
      capacityBytes: 1024,
      vendorId: 1,
      productId: 2,
      serialNumber: 'serial',
    );
    const second = UsbDevice(
      id: 'id',
      name: 'Disk',
      path: '/dev/sda',
      capacityBytes: 1024,
      vendorId: 1,
      productId: 2,
      serialNumber: 'serial',
    );
    expect(first, second);
    expect(first.hashCode, second.hashCode);
  });

  test('factory returns a safe discovery implementation', () async {
    final discovery = createUsbDeviceDiscovery();
    expect(discovery, isA<UsbDeviceDiscovery>());
    expect(await discovery.listDevices(), isA<List<UsbDevice>>());
  });

  test('unsupported discovery never fabricates devices', () async {
    const discovery = UnsupportedUsbDeviceDiscovery('test');
    expect(discovery.platform, 'test');
    expect(await discovery.listDevices(), isEmpty);
  });
}
