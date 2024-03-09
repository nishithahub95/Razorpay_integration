

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _razorpay = Razorpay();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  openGateWay(){
    var options = {
      'key': 'rzp_test_ZyAUCIyhB3bJeo',
      'amount': 1000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      }
    };
    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    TextEditingController paymentController=TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: TextFormField(
              controller: paymentController,
            ),
          ) ,
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              openGateWay();
            }, child:const Text('Pay Now'))
          ],
        ),
      ),
    );
  }
}
