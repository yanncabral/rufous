import 'dart:io';

import 'linux_usb_device_discovery.dart';
import 'unsupported_discoveries.dart';
import 'usb_device_discovery.dart';

UsbDeviceDiscovery createPlatformUsbDeviceDiscovery() {
  if (Platform.isLinux) return const LinuxUsbDeviceDiscovery();
  if (Platform.isWindows) return const WindowsUsbDeviceDiscovery();
  if (Platform.isMacOS) return const MacosUsbDeviceDiscovery();
  if (Platform.isAndroid) return const AndroidUsbDeviceDiscovery();
  if (Platform.isIOS) return const IosUsbDeviceDiscovery();
  return const UnsupportedUsbDeviceDiscovery('unknown IO platform');
}
