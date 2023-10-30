// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'package:to_do_app/widgets/bottamnavbar.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/profile/appinfo.dart';
import 'package:to_do_app/profile/privacypolicy.dart';
import 'package:to_do_app/profile/termsancondition.dart';
import 'package:package_info/package_info.dart';

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
  

 int currentIndex = 4;

  void onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}


  Future<void> showSignOutConfirmationDialog() async {
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
           
          ],
        );
      },
    );
  }

  String username = ''; 
  String email = ''; 

  

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
        builder: (context) =>  const PrivacyPolicyScreen(),
      ),
    );
  }

  void navigateToTermsAndConditionsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TermsConditionsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ItemListOne> itemList = [
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
          'Profile',
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
          Column(
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
                          navigateToEditPasswordScreen();
                        } else if (index == 1) {
                         navigateToPrivacyPolicyScreen();
                        } else if (index == 2) {
                          navigateToTermsAndConditionsScreen();
                        } 
                      },
                      child: Container(
                        height: 50,
                        width: 0.9 * MediaQuery.of(context).size.width,
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

            ],
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
        bottomSheet: FutureBuilder<String>(
        future: getAppVersion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // You can use a loading indicator while fetching the version.
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Text(
                'App Version: ${snapshot.data}',
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            );
          }
        },
      ),
    );
  }
}
