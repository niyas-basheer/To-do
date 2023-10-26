// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/widgets/bottamnavbar.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/database/signin.dart';
import 'package:to_do_app/sign/signin.dart';
import 'package:to_do_app/profile/appinfo.dart';
import 'package:to_do_app/profile/privacypolicy.dart';
import 'package:to_do_app/profile/termsancondition.dart';


class ItemListOne {
  final Icon icons;
  final String items;
  Widget? right;

  ItemListOne({required this.icons, required this.items, this.right});
}

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  int selectedIndex = 0;
  ValueNotifier<bool> isSwitched = ValueNotifier<bool>(false);

  void switched(bool value) {
    isSwitched.value = value;
  }
   void _loadUserProfileData() async {
    final signupBox = await Hive.openBox<UserModel>('users');
    final signupDetails = signupBox.get('users',
        defaultValue: UserModel(username: '', email: '', password: ''));

    setState(() {
      username = signupDetails!.username;
      email = signupDetails.email;
    });
  }

 int currentIndex = 4;

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<void> _showSignOutConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Sign Out'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const SignIn(),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  String username = ''; 
  String email = ''; 

  @override
  void initState() {
    super.initState();
    _loadUserProfileData(); 
  }

  void navigateToEditPasswordScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Appinfo()
      ),
    );
  }

  void navigateToPrivacyPolicyScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Privecy(),
      ),
    );
  }

  void navigateToTermsAndConditionsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TermsAndConditionsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ItemListOne> itemList = [
      ItemListOne(
        icons: const Icon(Icons.person_add_alt_1_rounded),
        items: username,
        
      ),
      ItemListOne(
        icons: const Icon(Icons.mail_lock),
        items: email,
        
      ),
      ItemListOne(
        icons: const Icon(Icons.info),
        items: 'App info',
        right: const Icon(Icons.chevron_right),
      ),
      ItemListOne(
        icons: const Icon(Icons.privacy_tip),
        items: 'Privacy Policy',
        right: const Icon(Icons.chevron_right),
      ),
      ItemListOne(
        icons: const Icon(Icons.settings_applications),
        items: 'Terms & condition',
        right: const Icon(Icons.chevron_right),
      ),
    ];

    return Scaffold(
      appBar:AppBar(
         automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'profile',
         style: TextStyle(
            fontSize: 15,
            color: blackcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Container(
            
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
               
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                           
                          } else if (index == 1) {
                           
                          } else if (index == 2) {
                            navigateToEditPasswordScreen();
                          } else if (index == 3) {
                            navigateToPrivacyPolicyScreen();
                          } else if (index == 4) {
                            navigateToTermsAndConditionsScreen();
                          }
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10),
                          padding: const EdgeInsets.all(.0),
                          decoration: BoxDecoration(
                            color: notselectedcolr,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            leading: itemList[index].icons,
                            title: Text(itemList[index].items),
                            trailing: itemList[index].right,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 50, left: 10, right: 10),
                  child: SizedBox(
                    width: 0.9 * MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _showSignOutConfirmationDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        backgroundColor:
                            secondaryColor,
                        alignment: Alignment.center,
                      ),
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(
                          fontSize: 16,
                          color: blackcolor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
