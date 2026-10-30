import 'usb_device_discovery.dart';
import 'usb_device_discovery_io.dart'
    if (dart.library.html) 'usb_device_discovery_web.dart';

export 'usb_device.dart';
export 'usb_device_discovery.dart';
export 'usb_device_discovery_io.dart'
    if (dart.library.html) 'usb_device_discovery_web.dart';

/// Creates the discovery implementation for the current Flutter target.
UsbDeviceDiscovery createUsbDeviceDiscovery() =>
    createPlatformUsbDeviceDiscovery();
