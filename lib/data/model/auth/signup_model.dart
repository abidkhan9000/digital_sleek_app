class SignUpModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? password;
  final String? photoUrl;

  SignUpModel({this.uid, this.email, this.name, this.password, this.photoUrl});

  Map<String, dynamic> toDocument() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}

// class SignInModel {
//    String? uid;
//    String? name;
//    String? email;
//    String? password;

//   SignInModel({this.uid, this.name, this.email, this.password});


//   SignInModel.fromDocument(Map<String, dynamic> document) {
//       name: document['name'];
//       email: document['email'];
//       password: document['password'];
//       uid: document['uid'];
//   }

// }

