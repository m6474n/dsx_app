
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ColorManager extends GetxController {
//   Color primaryColor = const Color(0xff506C83);
//   Color secondaryolor = const Color(0xff192229);
//   Color textColor = const Color(0xff181A1D);
//   Color whiteColor = const Color(0xffffffff);
//   Color bgColor = const Color(0xffffffff);
//   Color borderColor = const Color.fromARGB(94, 80, 108, 131);

//   lightTheme() {
//     textColor =const Color(0xff181A1D);
//     bgColor = const Color(0xffffffff);
//     Get.changeThemeMode(ThemeMode.light);
//     Get.changeTheme(ThemeData.light());

//     borderColor = const Color.fromARGB(255, 217, 217, 217);
//     update();
//   }

//   darkTheme() {
//     textColor = Colors.white;
//     bgColor = const Color(0xff192229);
//     Get.changeThemeMode(ThemeMode.dark);
//     Get.changeTheme(ThemeData.dark());
//     // borderColor = bgColor;
//     update();
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     loadThemeFromPreferences();
//     // getUserRole();
//   }

//   bool isDark = false;
//   void toggleTheme(bool newVal) {
//     isDark = newVal;
//     // isDarkTheme.value = newVal;
//     isDark ? darkTheme() : lightTheme();
//     saveThemeToPreferences(isDark);
//     update();
//   }

//   void loadThemeFromPreferences() async {
//     await SharedPreferences.getInstance().then((v) {
//       isDark = v.getBool('isDarkTheme') ?? false;
//       isDark ? darkTheme() : lightTheme();
//       // ("Id Dark theme:  $isDark");
//       update();
//     });
//   }

//   void saveThemeToPreferences(bool isDarkTheme) async {
//     await SharedPreferences.getInstance().then((v) {
//       v.setBool('isDarkTheme', isDarkTheme);
//       update();
//     });
//   }

//   // void getUserRole() async {
//   //   var currentUser = FirebaseAuth.instance.currentUser;
//   //   if (currentUser == null) {
//   //     await SharedPreferences.getInstance().then((v) {
//   //       var role = v.get("role");
//   //       primaryColor = role == "shop"
//   //           ? const Color(0xff1B6F72)
//   //           : const Color.fromARGB(255, 180, 104, 27);
//   //       // Update the theme after setting the primary color
//   //       isDark ? darkTheme() : lightTheme();
//   //       update();
//   //     });
//   //   } else {
//   //     FirebaseFirestore.instance
//   //         .collection("Users")
//   //         .doc(FirebaseAuth.instance.currentUser!.uid)
//   //         .snapshots()
//   //         .listen((snapshot) {
//   //       if (snapshot.exists) {
//   //         var role = snapshot.data()!['role'];
//   //         primaryColor = role == "shop"
//   //             ? const Color(0xff1B6F72)
//   //             : const Color.fromARGB(255, 180, 104, 27);
//   //         // Update the theme after setting the primary color
//   //         isDark ? darkTheme() : lightTheme();
//   //         update();
//   //       } else {
//   //         print('No user found');
//   //       }
//   //     }, onError: (error) {
//   //       print('Error: $error');
//   //     });
//   //   }
//   // }
// }