import 'package:flutter/material.dart';

import '../home_screen.dart';
import '../sing_up_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Вход',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                  color: Color(0xff3E4958)),),
            SizedBox(height: 130,),
            Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      child: Text('Войти',style: TextStyle(
                          fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700
                      ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Stack(
                    children: [
                      Divider(),
                      Center(child: Text('Или Войдите С помощью',style: TextStyle(fontSize: 15,
                          color: Color(0xFF7EAB3A),fontWeight: FontWeight.w700),)),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0,left: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/ic_facebook.png',),
                        Image.asset('assets/ic_twitter.png'),
                        Image.asset('assets/ic_gmail.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Нет учетной записи?",style: TextStyle(fontSize: 15,
                            color: Color(0xFF97ADB6),fontWeight: FontWeight.w400),),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                          },
                          child: Text("Регистрация",style: TextStyle(fontSize: 15,
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
