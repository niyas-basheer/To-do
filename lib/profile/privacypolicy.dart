import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/profile/app_bar.dart';

class Privecy extends StatelessWidget {
  const Privecy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: Customapp(title: 'Privacy Policy'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            '''
This is the Privacy Policy for our Task Management Application. Please read it carefully.

1. **Data Collection**: We collect certain data to enable the functionality of the app. This may include your name, email address, and the tasks you create.

2. **Data Use**: We use your data to provide the services of the app, such as task management and notifications. We do not sell your personal data to third parties.

3. **Data Storage and Security**: Your data is stored securely and we implement security measures to protect it.

4. **Cookies**: We may use cookies to enhance your experience with the app. You can opt out of cookie use in the app settings.

5. **Third-Party Services**: We may use third-party services to provide certain features. These third-party services will have their own privacy policies.

6. **Changes to this Policy**: We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.

Please note that this Privacy Policy is just a basic outline. You should consult with a legal advisor to create a Privacy Policy that covers all necessary points and complies with the law.
            ''',
            style: TextStyle(fontSize: 16, color: gray),
          ),
        ),
      ),
    );
  }
}
