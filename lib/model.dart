 final String contactsTable = 'contacts_table';

class ContactFields {

  static String colId = 'id';
  static String colFirstName = 'firstName';
  static String colLastName = 'lastName';
  static String colPhone = 'phone';
  static String colEmail = 'email';
  static String colAddress = 'address';
  static String colGender = 'gender';
  static String colSelected = "selected";
}

class Contact {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String gender;
  final String address;
  bool selected;

  Contact({
    this.gender,
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.address,
    this.selected,
  });

  toggleSelected() {
    selected =! selected;
  }


  Contact copyWith(
      {int id,
      String firstName,
      String lastName,
      String phone,
      String email,
      String gender,
      String address,
      bool selected}) {
    return Contact(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        selected: selected ?? this.selected);
  }

  Map<String, Object> toMap() {
    return {
      ContactFields.colId: id,
      ContactFields.colFirstName: firstName,
      ContactFields.colLastName: lastName,
      ContactFields.colPhone: phone,
      ContactFields.colGender: gender,
      ContactFields.colEmail: email,
      ContactFields.colAddress: address,
      ContactFields.colSelected: selected ? 1:0,
    };
  }

  factory Contact.fromMap(Map<String, Object> map) {
    return Contact(
        id: map[ContactFields.colId] as int,
        firstName: map[ContactFields.colFirstName] as String,
        lastName: map[ContactFields.colLastName] as String,
        phone: map[ContactFields.colPhone] as String,
        email: map[ContactFields.colEmail] as String,
        gender: map[ContactFields.colGender] as String,
        address: map[ContactFields.colAddress] as String,
        selected: map[ContactFields.colSelected] ==1);
  }
}
