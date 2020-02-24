import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_safety/componants/card.dart';
import 'package:personal_safety/componants/color.dart';
import 'package:personal_safety/componants/constant.dart';
import 'package:personal_safety/componants/mediaQuery.dart';
import 'package:personal_safety/models/register.dart';
import 'package:personal_safety/services/service_register.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegisterService get registerService => GetIt.instance<RegisterService>();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible;
  String errorMessages;
  RegisterCredentials register;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nationalIdController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  int nationalLength = 14;
  @override
  void initState() {
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: displaySize(context).height * .3,
                  width: displaySize(context).width * .6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: SvgPicture.asset(
                    'assets/images/location.svg',
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                        ),
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 85.0, left: 20.0, right: 20.0),
                        child: Container(
                          height: displaySize(context).height * .07,
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: _fullNameController,
                            style: new TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              errorBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "Full Name",
                              hintStyle: kHintStyle,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 155.0, left: 20.0, right: 20.0),
                        child: Container(
                          height: displaySize(context).height * .07,
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: _emailController,
                            style: new TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              errorBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: kHintStyle,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 225.0, left: 20.0, right: 20.0),
                        child: Container(
                          height: displaySize(context).height * .07,
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: _passwordController,
                            style: new TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                errorBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                hintStyle: kHintStyle),
                            obscureText: passwordVisible,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 295.0, left: 20.0, right: 20.0),
                        child: Container(
                          height: displaySize(context).height * .07,
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: _nationalIdController,
                            style: new TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(20),
                              errorBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "National ID",
                              hintStyle: kHintStyle,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: passwordVisible,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 365.0, left: 20.0, right: 20.0),
                        child: Container(
                          height: displaySize(context).height * .07,
                          decoration: kBoxDecorationStyle,
                          child: TextField(
                            controller: _phoneNumberController,
                            style: new TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
                                errorBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                hintStyle: kHintStyle),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 70.0, bottom: 10, right: 70),
                child: Container(
                  height: 50.0,
                  width: 200,
                  child: RaisedButton(
                    color: Accent1,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                    ),
                    onPressed: () async {
                      final register = RegisterCredentials(
                        fullName: _fullNameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        nationalId: _nationalIdController.text,
                        phoneNumber: _phoneNumberController.text,
                      );
                      final result = await registerService.Register(register);
                      debugPrint(
                          "from REGISTER status: " + result.status.toString());
                      debugPrint(
                          "from REGISTER token : " + result.result.toString());
                      debugPrint("from REGISTER error : " +
                          result.hasErrors.toString());
                      final title = result.hasErrors
                          ? 'Error'
                          : 'Registration Successful!';
                      final text = result.hasErrors
                          ? result.messages.toString()
                          : 'You can now Login with your created account!';
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(title),
                                content: Text(text),
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ],
                              )).then((data) {
                        if (result.result) {
                          Navigator.of(context).pop();
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
