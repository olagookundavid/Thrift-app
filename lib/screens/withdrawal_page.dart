import 'package:flutter/material.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text_input_fields.dart';

class WithdrawalPage extends StatelessWidget {
  WithdrawalPage({Key? key}) : super(key: key);
  final TextEditingController cardNo = TextEditingController();
  final TextEditingController amountNo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Enter Withdrawal',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              TextNumInputField(
                hintText: 'Card Number',
                controller: cardNo,
                isbold: true,
              ),
              const SizedBox(
                height: 15,
              ),
              TextNumInputField(
                hintText: 'Amount',
                controller: amountNo,
              ),
              const SizedBox(
                height: 15,
              ),
              ClickableButton(
                press: () {},
                text: 'Withdraw',
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ClickableButton(
                press: () {},
                text: 'Request Approval',
              ),
              const Spacer(),
              const Image(image: AssetImage('assets/logo.png')),
              const SizedBox(height: 5),
              const Text(
                'Thrift safely with us',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
