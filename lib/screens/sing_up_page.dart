import 'package:flutter/material.dart';

import 'Register_screen/register_page.dart';
import 'home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Регистрация',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                color: Color(0xff3E4958)),),
            SizedBox(height: 140,),
            Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ИМЯ',style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xff3E4958)),),
                  SizedBox(height: 6,),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      )
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text('Электронная почта',style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xff3E4958)),),
                  SizedBox(height: 6,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Пароль',style: TextStyle(
                      fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xff3E4958)),),
                  SizedBox(height: 6,),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      suffixIcon: Icon(Icons.visibility_off_outlined)
                    ),
                  ),
                  SizedBox(
                    height: 72,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff7EAB3A),
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                              ),
                      ),
                      child: Text('Зарегистрироваться',style: TextStyle(
                        fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Уже есть учетная запись?",style: TextStyle(fontSize: 15,
                            color: Color(0xFF97ADB6),fontWeight: FontWeight.w400),),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                          },
                          child: Text("Войти",style: TextStyle(fontSize: 15,
                              color: Color(0xFF7EAB3A),fontWeight: FontWeight.w400),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
