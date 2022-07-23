// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrift_project/resources/dialogues.dart';
import 'package:thrift_project/services/user_registration_service.dart';
import 'package:thrift_project/widgets/rounded_button.dart';

import '../widgets/text_input_fields.dart';

class RegisterCustomerPage extends StatelessWidget {
  RegisterCustomerPage({Key? key}) : super(key: key);
//   {
//     "firstname": "Walter",
//     "lastname": "O'Brien",
//     "middlename": "M",
//     "personal_email": "wb@mail.com",
//     "phone_no": "+1234567890293",
//     "home_address": "2A Boulevard, Hollywood",
//     "business_address": "2A Boulevard, Hollywood",
//     "state": "Kogi",
//     "bvn": "58945859458955",
//     "nin": "58945859458955",
//     "status": "Verified",
//     "balance": "0.00",
//     "contribution_plan": "weekly",
//     "existing_card_number": ""
// }

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController middlename = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController homeAddress = TextEditingController();
  final TextEditingController businessAddress = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController bvn = TextEditingController();
  final TextEditingController nin = TextEditingController();
  final TextEditingController status = TextEditingController();
  final TextEditingController balance = TextEditingController();
  final TextEditingController plan = TextEditingController();
  final TextEditingController existingcardnumber = TextEditingController();
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
            // height: MediaQuery.of(context).size.height,
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
                        controller: middlename,
                        color: const Color(0xFFDDDDDD)),
                    TextEmailInputField(
                      hintText: "email",
                      controller: email,
                      color: const Color(0xFFD9D9D9),
                      isbold: true,
                    ),
                    TextPhoneNumInputField(
                      hintText: "Phone Number",
                      controller: phoneNo,
                      color: const Color(0xFFD6D6D6),
                      isbold: true,
                    ),
                    TextAddressInputField(
                        hintText: "Home Address",
                        controller: homeAddress,
                        color: const Color(0xFFC8C8C8)),
                    TextAddressInputField(
                        hintText: "Business Address",
                        controller: businessAddress,
                        color: const Color(0xFFCBCBCB)),
                    TextInputField(
                        hintText: "State",
                        controller: state,
                        color: const Color(0xFFCBCBCB)),
                    TextNumInputField(
                      hintText: "Bvn",
                      controller: bvn,
                      color: const Color(0xFFD3D3D3),
                      isbold: true,
                    ),
                    TextNumInputField(
                      hintText: "NIN",
                      controller: nin,
                      color: const Color(0xFFD2D2D2),
                      isbold: true,
                    ),
                    TextInputField(
                        hintText: "Status",
                        controller: status,
                        color: const Color(0xFFCBCBCB)),
                    TextNumInputField(
                      hintText: "Balance",
                      controller: balance,
                      color: const Color(0xFFD3D3D3),
                      isbold: true,
                    ),
                    TextInputField(
                      hintText: "Contribution Plan",
                      controller: plan,
                      color: const Color(0xFFD3D3D3),
                      isbold: true,
                    ),
                    TextNumInputField(
                      hintText: "Existing card number",
                      controller: existingcardnumber,
                      color: const Color(0xFFD3D3D3),
                      isbold: true,
                    ),
                  ],
                ),
                const Text(
                  'By creating account you accept the Terms and Conditions and privacy policy',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClickableButton(
                    press: () async {
                      bool isRegistered = await Registration().registerUser(
                          firstname.text,
                          lastname.text,
                          middlename.text,
                          email.text,
                          phoneNo.text,
                          homeAddress.text,
                          businessAddress.text,
                          state.text,
                          bvn.text,
                          nin.text,
                          status.text,
                          balance.text,
                          plan.text,
                          existingcardnumber.text);
                      if (isRegistered) {
                        await successDialog(
                            context, 'User was registered successfully');
                      }
                      await showErrorDialog(context, 'User not registered');
                    },
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
