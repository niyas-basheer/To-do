
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:to_do/domain/repositary/notification_function.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat.yMMMMd().format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'INR', symbol: '₹').format(amount); 
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(\${phoneNumber.substring(0, 3)}) \${phoneNumber.substring(3, 6)}-\${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '\${phoneNumber.substring(0, 1)} (\${phoneNumber.substring(1, 4)}) \${phoneNumber.substring(4, 7)}-\${phoneNumber.substring(7)}';
    }
    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }


static DateTime parseTimeString(String timeString) {
  // Split the time string into its components
  final RegExp timePattern = RegExp(r'(\d+):(\d+)\s*(AM|PM)', caseSensitive: false);
  final match = timePattern.firstMatch(timeString);

  if (match != null) {
    // Extract the hour, minute, and period (AM/PM)
    int hour = int.parse(match.group(1)!);
    int minute = int.parse(match.group(2)!);
    String period = match.group(3)!.toUpperCase();

    // Convert to 24-hour format
    if (period == "PM" && hour != 12) {
      hour += 12;
    } else if (period == "AM" && hour == 12) {
      hour = 0;
    }

    // Get the current date
    DateTime now = DateTime.now();

    // Create the DateTime object with the parsed time
    return DateTime(now.year, now.month, now.day, hour, minute);
  } else {
    throw const FormatException("Invalid time format");
  }
}



static void calculateTimeLeftandsendNotification(String date, DateTime startTime,String title,String body,String payload) {
  try {
    // Parse the date part
    DateTime datePart = DateFormat.yMMMMEEEEd().parse(date);
  
    

    // Combine date and time into a single DateTime object
    DateTime combinedDateTime = DateTime(
      datePart.year,
      datePart.month,
      datePart.day,
      startTime.hour,
      startTime.minute,
    );

    // Calculate the difference between now and the combined date-time
    DateTime now = DateTime.now();
    Duration difference = combinedDateTime.difference(now);

    // Extract days, hours, and minutes
    int daysLeft = difference.inDays;
    int hoursLeft = difference.inHours.remainder(24);
    int minutesLeft = difference.inMinutes.remainder(60);

    // Create a summary of the time left
  
NotificationFunction.showScheduleNotification(
                      title: title,
                      body: body,
                      payload: payload,
                      day: daysLeft,
                      hour:hoursLeft,
                      minute: minutesLeft,
                      );
  } catch (e) {
    if (kDebugMode) {
      print("Error in calculateTimeLeft: $e");
    }
  }
}
}
