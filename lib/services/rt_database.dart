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
  Future<void> userSignUp({userID, fullName, contact, email, gender}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");

    await ref.set({
      "fullName": fullName,
      "email": email,
      "gender": gender,
      "contact": contact,
      "height": "",
      "weight": "",
      "goal": "",
      "picture": ""
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

  // Update the user's package after purchase
  Future<void> userPackageUpdate({userID, package}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");
    var date = DateTime.now();

    await ref.update({
      "package": package,
      "packagePurchased": date.toString(),
      "packageExpiry": date.add(const Duration(days: 56)).toString()
    });
  }

  // Check if a user is a client
  Future<bool> isUserClient({userID}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");

    final snap = await ref.get();

    // Check if a result is returned
    if (snap.exists){

      var data = snap.value as Map;

      if (data['package'] == null){
        return false;
      }

      //Check if the expiry date has passed
      if (DateTime.now().compareTo(DateTime.parse(data['packageExpiry'])) > 0){
        return false;
      }

      // Package has not expired
      return true;
    }

    return false;

  }

  // Get user details
  Future<Map> getUser({userID}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Users/$userID");

    final snap = await ref.get();

    if (snap.exists){
      var data = snap.value as Map;
      return data;
    }
    else{
      return {};
    }
  }

  // Get the workouts for a particular day
  Future<Map> getWorkouts({day, goal}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("DailyWorkouts/$goal/$day");

    var snap = await ref.get();

    if (snap.exists){
      var data = snap.value as Map;
      return data;
    }
    else{
      return {};
    }
  }

  // Get the meals for a particular day
  // Get the workouts for a particular day
  Future<Map> getMeals({day}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("Meals/$day");

    var snap = await ref.get();

    if (snap.exists){
      var data = snap.value as Map;
      return data;
    }
    else{
      return {};
    }
  }

}