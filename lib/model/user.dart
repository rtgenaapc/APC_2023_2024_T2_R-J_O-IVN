import 'dart:convert';

class users {
  final String User_Id;
  final String User_Name;
  final String User_Password;
  final String User_Email;
  final String User_Address;
  final String User_Type;
  final String User_Token;
  users({
    required this.User_Id,
    required this.User_Name,
    required this.User_Password,
    required this.User_Email,
    required this.User_Address,
    required this.User_Type,
    required this.User_Token,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'User_Id': User_Id});
    result.addAll({'User_Name': User_Name});
    result.addAll({'User_Password': User_Password});
    result.addAll({'User_Email': User_Email});
    result.addAll({'User_Address': User_Address});
    result.addAll({'User_Type': User_Type});
    result.addAll({'User_Token': User_Token});

    return result;
  }

  factory users.fromMap(Map<String, dynamic> map) {
    return users(
      User_Id: map['User_Id'] ?? '',
      User_Name: map['User_Name'] ?? '',
      User_Password: map['User_Password'] ?? '',
      User_Email: map['User_Email'] ?? '',
      User_Address: map['User_Address'] ?? '',
      User_Type: map['User_Type'] ?? '',
      User_Token: map['User_Token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory users.fromJson(String source) => users.fromMap(json.decode(source));
}
