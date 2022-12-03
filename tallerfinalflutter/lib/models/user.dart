// To parse this JSON data, do
//
//     final listUsers = listUsersFromMap(jsonString);

import 'dart:convert';


class UsersList {
  final List<User> users;

  UsersList({
    this.users,
});

  factory UsersList.fromJson(List<dynamic> parsedJson) {

    List<User> users ;
    users = parsedJson.map((i)=>User.fromJson(i)).toList();

    return new UsersList(
      users: users
    );
  }
}

class User {
    User({
        this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
    });

    int id;
    String name;
    String username;
    String email;
    String address;
    String phone;
    String website;
    Company company;

    String idUser;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        website: json["website"],
        company: Company.fromMap(json["company"]),
    );

  /*  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address,
        "phone": phone,
        "website": website,
        "company": company.toMap(),
    };*/
}


class Company {
    Company({
        this.name,
        this.catchPhrase,
        this.bs,
    });

    String name;
    String catchPhrase;
    String bs;

    factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
