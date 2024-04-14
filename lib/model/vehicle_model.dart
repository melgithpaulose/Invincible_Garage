class Customer {
  String? customerName;
  String? phoneNumber;
  String? service;
  String? vehicleBrand;
  String? vehicleNumber;
  bool? iscompleted;
  bool? isapproved;

  Customer({
    this.customerName,
    this.phoneNumber,
    this.service,
    this.vehicleBrand,
    this.vehicleNumber,
    this.iscompleted,
    this.isapproved,
  });

  // Factory method to convert Firestore document snapshot to Customer object
  factory Customer.fromFirestore(Map<String, dynamic> data) {
    return Customer(
      customerName: data['customer_name'],
      phoneNumber: data['phone_number'],
      service: data['service'],
      vehicleBrand: data['vehicle_brand'],
      vehicleNumber: data['vehicle_number'],
      isapproved: data['isapproved'] ?? false,
      iscompleted: data['iscompleted'] ?? false,
    );
  }

  @override
  String toString() {
    return 'Customer{customerName: $customerName, phoneNumber: $phoneNumber, service: $service, vehicleBrand: $vehicleBrand, vehicleNumber: $vehicleNumber}';
  }
}
