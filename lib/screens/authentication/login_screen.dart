import 'package:ellipsis_rn_challenge/screens/products/product_list.dart';
import 'package:ellipsis_rn_challenge/utils/constants.dart';
import 'package:ellipsis_rn_challenge/widgets/elevated_button_widget.dart';
import 'package:ellipsis_rn_challenge/widgets/input_field_widget.dart';
import 'package:ellipsis_rn_challenge/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool isHidden = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Center(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              const LabelWidget(
                labelText: "Username",
              ),
              SizedBox(height: size.height * 0.01),
              InputFieldWidget(
                obscureText: false,
                keyboardType: TextInputType.phone,
                controller: _usernameController,
                hintText: "Username",
              ),
              SizedBox(height: size.height * 0.02),
              const LabelWidget(
                labelText: "Username",
              ),
              SizedBox(height: size.height * 0.01),
              InputFieldWidget(
                  obscureText: isHidden,
                  icon: IconButton(
                      icon: Icon(
                        isHidden == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isHidden ^= true;
                          //print("Icon button pressed! state: $_passwordVisible"); //Confirmed that the _passwordVisible is toggled each time the button is pressed.
                        });
                      }),
                  controller: _passwordController,
                  hintText: "Your password"),
              SizedBox(height: size.height * 0.2),
              elevatedButtonMethod(size, context, "SignIn", () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ProductListScreen()));
              }),
              SizedBox(height: size.height * 0.03),
              const Center(
                child: Text(
                  "Dont have an account?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              elevatedButtonMethod(size, context, "SignUp", () {}),
              SizedBox(height: size.height * 0.03),
              const Center(
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
