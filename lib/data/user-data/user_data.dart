import 'dart:convert';


// List<UserData> parseAuthData(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<UserData>((json) => UserData.fromJson(json)).toList();
// }

class UserData {
   String id;
  // final String title;
   String idToken;

  UserData._privateConstructor();

  static final UserData _singleton = UserData._privateConstructor();

    
    factory UserData() {
      return _singleton;
    }

    void addUserData( id, idtoken) {
      this.id = id ;
      this.idToken = idtoken;

    }

    String getUserId() {
      return this.id;

    }
  // final String thumbnailUrl;

  // UserData({this.id, this.idToken});

  // factory UserData.fromJson(Map<String, dynamic> json) {
  //   return UserData(
  //     id: json['id'] as int,
  //     this.idToken: json['localId'] as String,
     
  //   );
  // }
}