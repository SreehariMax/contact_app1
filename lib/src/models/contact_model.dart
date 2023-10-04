class ContactModel {
  final String fname;
  final String lname;
  final String address;
  final String phone;
  final String email;

  ContactModel({required this.fname, required this.lname, required this.address, required this.phone, required this.email});

  factory ContactModel.fromJSON(Map<String, dynamic> json) {
    return ContactModel(
        fname: json['First Name'],
        lname: json['Last Name'],
        email: json['Email'],
        phone: json['Phone'],
        address: json['Address']);
  }
  Map<String, dynamic> toJSON() {
    return {
      "First Name": this.fname,
      "Last Name": this.lname,
      "Email": this.email,
      "Phone": this.phone,
      "Address": this.address
    };
  }
}
