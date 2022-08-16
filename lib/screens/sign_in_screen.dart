import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/sign_up_screen.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool _isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email"),
                      ],
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      RegExp rex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!rex.hasMatch(value!)) {
                        return "The email format is incorrect";
                      }
                    },
                    decoration: const InputDecoration(
                      fillColor: Color(0xffF7F8F9),
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      // labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Pssword"),
                      ],
                    ),
                  ),
                  TextFormField(
                    obscureText: _isPassHidden,
                    validator: (value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if (!regex.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      fillColor: Color(0xffF7F8F9),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPassHidden = !_isPassHidden;
                            });
                          },
                          icon: _isPassHidden
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      suffixIconColor: Colors.grey,
                      // labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff7EAB3A),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 18),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              // final isValid = formKey.currentState?.validate();
                              Navigator.of(
                                  context).pushAndRemoveUntil(MaterialPageRoute(
                                  builder: (context) => HomePage()), (Route<dynamic>route) => false);
                            });
                          },
                          child: const Text("Registration"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      const Text(
                        "Or Login With",
                        style: TextStyle(
                          color: Color(0xff3E4958),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.036,),
                  Container(
                      width: MediaQuery.of(context).size.width*0.51,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/ic_facebook.png"),
                          // SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                          Image.asset("assets/ic_twitter.png"),
                          // SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
                          Image.asset("assets/ic_gmail.png"),
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisPAge()));
                          });
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Color(0xff7EAB3A)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
