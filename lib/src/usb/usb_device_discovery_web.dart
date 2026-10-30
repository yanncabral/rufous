import 'unsupported_discoveries.dart';
import 'usb_device_discovery.dart';

UsbDeviceDiscovery createPlatformUsbDeviceDiscovery() =>
    const WebUsbDeviceDiscovery();
