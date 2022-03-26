import 'package:firebase_database/firebase_database.dart';

class RTDatabase {

  Future<void> getGoals() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Goals");

    final snap = await ref.get();

    if (snap.exists){
      print(snap.value.toString());
    }
    else{
      print("Error");
    }
  }

  //Insert a new user into the database
  Future<void> userSignUp({userID, fullName, contact, email, age, gender}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");

    await ref.set({
      "fullName": fullName,
      "email": email,
      "age": age,
      "gender": gender,
      "contact": contact
    });

  }

  // Update a user's information when they save their profile
  Future<void> userProfileUpdate({userID, fullName, contact, email, height, weight, goal, picture}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");

    await ref.update({
      "fullName": fullName,
      "email": email,
      "contact": contact,
      "height": height,
      "weight": weight,
      "goal": goal,
      "picture": picture
    });
  }

  Future<void> userPackageUpdate({userID, package}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");

    await ref.update({
      "package": package
    });
  }

}