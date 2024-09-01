import 'package:flutter/material.dart';

class TTexts{

  // -- onboarding texts 
  static const String onBoardingTitle1="Choose your location";
  static const String onBoardingTitle2="select the stay";
  static const String onBoardingTitle3="make the payment";

  static const String onBoardingSubTitle1="Welcome to a World of Limitless Choices - Your perfect Stay Awaits";
  static const String onBoardingSubTitle2="For Seamless expireance, Choose Your Choise of Stay - Your Convenience, Our Priority";
  static const String onBoardingSubTitle3="Choose the Best That Suits Your Pocket - Every Type is Available ";
  

  
  


 // Authentication Form Texts
static const String firstName = "First Name";
static const String lastName = "Last Name";
static const String email = "E-Mail";
static const String password = "Password";
static const String confirmPassword= "confirm Password";
static const String newPassword = "New Password";
static const String username = "Username";
static const String phoneNumber = "Phone number";
static const String rememberMe = "Remember Me?";
static const String forgetPassword = "Forget Password?";
static const String signIn = 'Sign In';
static const String createAccount = 'Create Account';
static const String orSignInWith = 'or sign in with:';
static const String orSignUpWith = 'or sign Up with:';
static const String iAgreeTo = "I agree to";
static const String privacyPolicy = "Privacy Policy";
static const String termsOfUse = "Terms of use";
static const String verificationCode = "verificationCode";
static const String resendEmail = "Resend Email";
static const String resendEmailIn = "Resend email in";

// Authentication Form Texts
static const String loginTitle = "Welcome back!";
static const String loginSubTitle="Discover Limitless Choices and Unmatched convenience.";
static const String signupTitle = "Let's create your account";
static const String forgetPasswordTitle = "Forgot password?";
static const String forgetPasswordSubTitle = "Don't worry! It seems people can forget too. Enter your email and we will send you a password reset link.";
static const String changeYourPasswordTitle = "Password Reset Email Sent";
static const String changeYourPasswordSubTitle = "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.";
static const String confirmEmail= "Verify Your Email Address!";
static const String confirmEmailSubTitle = "Congratulations! Your Account Awaits. Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.";
static const String emailNotReceivedMessage = "Didn't get the email? Check your junk/spam or resend it.";
static const String yourAccountCreatedTitle = " Your account successfully created!";
static const String yourAccountCreatedSubTitle = "Welcome to Your Ultimate Shopping Destination - [Brand]. Your Account is Created! Unleash the Joy of Seamless Online Shopping!";
static const String and= "and";
static const String tContinue= "Continue";
static const String submit ="Submit";
static const String done ="Done";
static const String homeAppBarTitle ="Welcome back to Stay";
static const String addProdectTitle ="Match your property to the right travelers.";
static const String propertyNameTitle ="Name your property";
static const String propertyDescriptionTitle ="Discribe your property";
static const String addProdectTitle2 ="Put yourself on the map.";
static const String streetAdress ="street adress";
static const String buildingAdress ="Building,floor and unit number";
static const String region ="Land mark";
static const String state ="state / Province";
static const String city ="city";
static const String pinCode ="ZIP / Pin code";
static const String maplocation ="Map location";
static const String facilities ="what's unique and wonderful about your property? ";
static const String accesstitle1 ="Access";
static const String accesstitle2 ="Important information";
static const String details ="Setup your rooms";
static const String accesstitle3 ="Kitchen";
static const String subdetail ="you only need to create one room type at this stage.";
static const String roomname ="Room name: ";
static const String roomsize ="Room size";
static const String accommodates ="Accommodates";
static const String bathrooms ="Bathrooms";
static const String roomsanddetails  ="Rooms and details";
static const String roomsphotos  ="Show them what they'er missing";
static const String propertyphotos  ="Property Photos";
static const String contract  ="Sign your contract and let's get booking.";
static const String contracttext2  ="Know your local laws, regulations, and taxes";
static const String contracttext3  ='''It is your responsibility to review local laws and taxes.

            Be aware of your local regulations, laws, and tax obligations before you take bookings. Many countries and a number of cities
            have specific laws regarding using your property as a short term rental, for home sharing and/or for professional hosting. It is
            your responsibility to work within your own country's legal framework which may include obtaining the relevant license, permit
            or registration before taking bookings, and paying any applicable taxes on any income you generate from such bookings.''';
static const String contractterms  ='''and certify that 
I will follow all applicable laws and regulations.''';
static const String contracttermsandconditions  ="terms and conditions";
// List of options
static List<String> options = [
  'Guesthouse Bed & Breakfast',
  'Serviced Apartment',
  'Hostel',
  'Homestay',
  'Hotel',
  'Apartment',
];

// List of subtext for each option
static List<String> subtext = [
  'Private home or estate shared by host and guest, with separate rentable living space within',
  'Apartment unit with basic services like cleaning and front desk',
  'Budget accommodation with dormitory bed arrangements and shared bathrooms',
  'Private home or estate shared by host and guest, with rentable rooms and shared facilities',
  'Multi-unit accommodation building with shared facilities, restaurants, and services',
  'Independently hosted, self-contained accommodation unit within a larger block of similar units',
];
static List<String> cancellation = [
  'Flexible',
  'Moderate',
  'Strict',
];
static List<String> cancellationsubtext = [
  'Guests can cancel up to 1 day prior to check-in for a 100% refund. In case of a no show, you will receive 100% of the booking price.',
  'Guests can cancel up to 5 days prior to check-in for a 100% refund. In case of a no show, you will receive 100% of the booking price.',
  'Guests can cancel up to 7 days prior to check-in for a 50% refund. In case of a no show, you will receive 100% of the booking price.',
  
];

static List<Map<String, dynamic>> checkboxItems = [
  {'title': 'Check-in/out (private)', 'isCheck': false},
  {'title': 'Keyless access', 'isCheck': false},
   {'title': 'Check-in (24-hour)', 'isCheck': false},
  {'title': 'Car park', 'isCheck': false},
   {'title': 'Front desk [24-hour]', 'isCheck': false},
];
static List<Map<String, dynamic>> checkboxItems2 = [
  
  {'title': 'A/C', 'isCheck': false},
   {'title': 'Complimentary WiFi in all rooms', 'isCheck': false},
  {'title': 'Daily cleaning ', 'isCheck': false},
   {'title': 'Breakfast [free]', 'isCheck': false},
  {'title': 'Laundry service', 'isCheck': false},
   {'title': 'Transport to airport', 'isCheck': false},
  {'title': 'Shared kitchen ', 'isCheck': false},
];
static List<Map<String, dynamic>> checkboxItems3 = [
   {'title': 'Stove', 'isCheck': false},
  {'title': 'Refrigerator', 'isCheck': false},
   {'title': 'Oven', 'isCheck': false},
  {'title': 'Microwave', 'isCheck': false},
   {'title': 'Freezer', 'isCheck': false},
  {'title': 'Kitchen basics (cookware oils condiments) ', 'isCheck': false},
   {'title': 'Kitchenware', 'isCheck': false},
  {'title': 'Dishwasher', 'isCheck': false},
];

static List<String> indianStates = [
  "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttar Pradesh",
  "Uttarakhand",
  "West Bengal",
  "Andaman and Nicobar Islands",
  "Chandigarh",
  "Dadra and Nagar Haveli and Daman and Diu",
  "Lakshadweep",
  "Delhi",
  "Puducherry",
];
static const List<IconData> icons =[ 
    Icons.home_filled,Icons.shopping_cart_outlined,Icons.business_center,Icons.person,
  ];
  static const List<Color> colurs =[
    Colors.green,Colors.red,Colors.blue,Colors.indigo,
  ];
  static const List<String> name =[
   'Property','Bookings','Claint','Users'
  ];

 
}