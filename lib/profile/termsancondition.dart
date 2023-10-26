import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/color.dart';
import 'package:to_do_app/profile/app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:Customapp(title:  'Terms and Conditions'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Welcome to our Task Management Application. Please read these Terms and Conditions carefully before using our application.

1. **Terms of Use**: By downloading and using this application, you agree to abide by these Terms and Conditions.

2. **Task Creation and Management**: Users are responsible for creating tasks, setting deadlines, and managing their tasks. We are not responsible for any missed deadlines or forgotten tasks.

3. **Data Privacy**: All user data such as task details, user names, and other personal data are stored securely. We do not share your personal data with third parties without your consent.

4. **User Responsibilities**: Users are responsible for all activities that occur in their account. If we notice any suspicious activity on your account, we may temporarily or permanently suspend your account.

5. **Account Termination**: We reserve the right to terminate your account if you violate our Terms and Conditions.

6. **Dispute Resolution**: Any disputes arising out of the use of our application will be governed by the laws of our country.

7. **Changes to Terms and Conditions**: We may update our Terms and Conditions from time to time. We will notify you of any changes by posting the new Terms and Conditions on this page.

Please note that these Terms and Conditions are just a basic outline. You should consult with a legal advisor to create Terms and Conditions that cover all the necessary points and comply with the law.
            ''',
            style: TextStyle(fontSize: 16, color: gray),
          ),
        ),
      ),
    );
  }
}
