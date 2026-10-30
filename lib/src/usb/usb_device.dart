/// A USB device visible to the application.
///
/// Fields that the operating system does not expose are left null. The
/// [id] is stable for the duration of a discovery session, but should not be
/// treated as a portable hardware serial number.
class UsbDevice {
  const UsbDevice({
    required this.id,
    required this.name,
    this.path,
    this.capacityBytes,
    this.vendorId,
    this.productId,
    this.serialNumber,
  });

  final String id;
  final String name;
  final String? path;
  final int? capacityBytes;
  final int? vendorId;
  final int? productId;
  final String? serialNumber;

  @override
  bool operator ==(Object other) =>
      other is UsbDevice &&
      other.id == id &&
      other.name == name &&
      other.path == path &&
      other.capacityBytes == capacityBytes &&
      other.vendorId == vendorId &&
      other.productId == productId &&
      other.serialNumber == serialNumber;

  @override
  int get hashCode => Object.hash(
    id,
    name,
    path,
    capacityBytes,
    vendorId,
    productId,
    serialNumber,
  );
}
