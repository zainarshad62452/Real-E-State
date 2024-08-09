import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:realstate/core/components/snackbar.dart';
import 'package:realstate/core/config/constants.dart';
import 'package:http/http.dart' as http;

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(int amount) async {
    try {
      String? paymentIntentClientSecret = await createPaymentIntent(
        amount,
        "usd",
      );
      if (paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Muhammad Bilal",
        ),
      );
      await _processPayment();
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic>? paymentIntentData;
  //  Future<Map<String, dynamic>>
  Future<String?> createPaymentIntent(int amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': _calculateAmount(amount),
        'currency': currency,
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      // Decode the JSON response
      var responseBody = json.decode(response.body);

      if (responseBody['client_secret'] != null) {
        String clientSecret = responseBody['client_secret'];
        if (kDebugMode) {
          print("::: Client Secret: $clientSecret");
        }
        return clientSecret;
      }
      return null;
    } catch (err) {
      snackbar("Failed", 'Error charging user: ${err.toString()}');
      return null;
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print('::: $e');
    }
  }

  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}


  // StripeService.instance.makePayment();
