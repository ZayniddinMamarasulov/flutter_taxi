import 'package:flutter/material.dart';

class SecondDrawerScreen extends StatelessWidget {
  const SecondDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var size = mediaQuery.size;
    var orientation = mediaQuery.orientation;
    return SafeArea(
      child: Scaffold(
        body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70,),
                  CircleAvatar(
                    radius: 49,
                    backgroundColor: Colors.lightGreen,
                    child: CircleAvatar(
                        radius: 46,
                       backgroundImage: AssetImage("assets/men.jpg"),
                    ),
                  ),
                  Text("Xondamir",style: TextStyle(color: Colors.black54
                  ,fontWeight: FontWeight.bold,fontSize: 22
                  ),
                  ),
                  Text("O'skanov@yandex.ru")
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        shadowColor: Colors.black38,
                        elevation: 32,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          height: 140,
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff7cb342),
                                radius: 21,
                                child:Icon(Icons.history_rounded,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ),
                              // Image(image: AssetImage("assets/istoriya.png",),
                              // ),
                              SizedBox(height: 8,),
                              Text("TARIX",
                                style: TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        shadowColor: Colors.black38,
                        elevation: 32,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          height: 140,
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff7cb342),
                                radius: 21,
                                child:Icon(Icons.credit_card_rounded,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ),
                              // Image(image: AssetImage("assets/istoriya.png",),
                              // ),
                              SizedBox(height: 8,),
                              Text("TO'LOV USULI",
                                style: TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        shadowColor: Colors.black38,
                        elevation: 32,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          height: 140,
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff7cb342),
                                radius: 21,
                                child:
                                Icon(Icons.sell_rounded,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ),
                              SizedBox(height: 8,),
                              Text("KUPON KODI",
                                style: TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        shadowColor: Colors.black38,
                        elevation: 32,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          height: 140,
                          width: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff7cb342),
                                radius: 21,
                                child:Icon(Icons.support_agent,
                                  color: Colors.white,
                                  size: 24,
                                )
                              ),
                              // Image(image: AssetImage("assets/istoriya.png",),
                              // ),
                              SizedBox(height: 8,),
                              Text("YORDAM",
                                style: TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
