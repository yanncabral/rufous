import 'usb_device_discovery.dart';

/// Windows implementation placeholder. Native enumeration is intentionally
/// not emulated until removable-drive and permission semantics are defined.
class WindowsUsbDeviceDiscovery extends UnsupportedUsbDeviceDiscovery {
  const WindowsUsbDeviceDiscovery() : super('Windows');
}

/// macOS implementation placeholder. IOKit integration is still pending.
class MacosUsbDeviceDiscovery extends UnsupportedUsbDeviceDiscovery {
  const MacosUsbDeviceDiscovery() : super('macOS');
}

/// Android implementation placeholder. USB host permission requires a native
/// plugin and an application-level permission flow.
class AndroidUsbDeviceDiscovery extends UnsupportedUsbDeviceDiscovery {
  const AndroidUsbDeviceDiscovery() : super('Android');
}

/// iOS does not expose general USB mass-storage enumeration to applications.
class IosUsbDeviceDiscovery extends UnsupportedUsbDeviceDiscovery {
  const IosUsbDeviceDiscovery() : super('iOS');
}

/// Browsers do not expose devices without an explicit WebUSB user gesture.
class WebUsbDeviceDiscovery extends UnsupportedUsbDeviceDiscovery {
  const WebUsbDeviceDiscovery() : super('Web');
}
