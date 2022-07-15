import 'package:flutter/material.dart';
import 'package:thrift_project/widgets/rounded_button.dart';

import '../widgets/text_input_fields.dart';

class RegisterCustomerPage extends StatelessWidget {
  RegisterCustomerPage({Key? key}) : super(key: key);
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController othername = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController cardNo = TextEditingController();
  final TextEditingController oldAccId = TextEditingController();
  final TextEditingController businessAddress = TextEditingController();
  final TextEditingController homeAddress = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Create Customer Account',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Gradient-6.png'), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                    Spacer(),
                    Text('Upload Photo',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600)),
                    Spacer(),
                  ],
                ),
                Column(
                  children: [
                    TextInputField(
                      hintText: "First Name",
                      controller: firstname,
                      color: const Color(0xFFE4E4E4),
                      isbold: true,
                    ),
                    TextInputField(
                        hintText: "Last Name",
                        controller: lastname,
                        color: const Color(0xFFDCDCDC)),
                    TextInputField(
                        hintText: "Other Names",
                        controller: othername,
                        color: const Color(0xFFDDDDDD)),
                    TextAddressInputField(
                      hintText: "Address",
                      controller: address,
                      color: const Color(0xFFD9D9D9),
                      isbold: true,
                    ),
                    TextPhoneNumInputField(
                      hintText: "Phone Number",
                      controller: phoneNo,
                      color: const Color(0xFFD6D6D6),
                      isbold: true,
                    ),
                    TextNumInputField(
                      hintText: "Card Number",
                      controller: cardNo,
                      color: const Color(0xFFD3D3D3),
                      isbold: true,
                    ),
                    TextNumInputField(
                        hintText: "Old Account ID",
                        controller: oldAccId,
                        color: const Color(0xFFD2D2D2)),
                    TextAddressInputField(
                        hintText: "Business Address",
                        controller: businessAddress,
                        color: const Color(0xFFCBCBCB)),
                    TextAddressInputField(
                        hintText: "Home Address",
                        controller: homeAddress,
                        color: const Color(0xFFC8C8C8))
                  ],
                ),
                const Text(
                  'By creating account you accept the Terms and Conditions and privacy policy',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClickableButton(
                    press: () {},
                    text: 'Create account',
                    color: const Color(0xFF0060C8),
                  ),
                ),
                const Text(
                  'Thrift safely with us',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
