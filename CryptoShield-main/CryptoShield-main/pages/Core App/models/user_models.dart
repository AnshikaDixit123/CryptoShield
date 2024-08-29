

class UserModel {
  
  final String fullName;
  final String email;
  final String phoneNo;

  const UserModel({

    required this.email,
    required this.fullName,
    required this.phoneNo,
  });

  toJson(){
    return{
      "UserData": fullName,
      "AlphabetFinding": email,
      "NumericFindings": phoneNo,
    };
  }
}