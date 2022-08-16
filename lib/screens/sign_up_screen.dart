import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';


class RegisPAge extends StatefulWidget {
  RegisPAge({Key? key}) : super(key: key);

  @override
  State<RegisPAge> createState() => _RegisPAgeState();
}

class _RegisPAgeState extends State<RegisPAge> {
  final formKey = GlobalKey<FormState>();
  bool _isPassHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name"),
                      ],
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Less than 6 characters";
                      }
                    },
                    decoration: const InputDecoration(
                      fillColor: Color(0xffF7F8F9),
                      filled: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)
                        ),
                      ),
                      // labelText: "Name",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      RegExp rex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
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
                      children: [
                        Text("Pssword"),
                      ],
                    ),
                  ),
                  TextFormField(
                    obscureText: _isPassHidden,
                    validator: (value) {
                      RegExp regex =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      fillColor: Color(0xffF7F8F9),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState((){
                              _isPassHidden = !_isPassHidden;
                            });
                          },
                          icon: _isPassHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      suffixIconColor: Colors.grey,
                      // labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              // final isValid = formKey.currentState?.validate();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                            });
                          },
                          child: const Text("Registration"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 110,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // final isValid = formKey.currentState?.validate();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                          });
                        },
                        child: const Text(
                          " Sign in",
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
