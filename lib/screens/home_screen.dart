import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(4),
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Image.asset('assets/ic_menu.png'),
                    ),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {
                    buildBottomSheet(context);
                  },
                  child: Text('show bottomsheet')),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.green,
      ),
    );
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    offset: Offset(-1, -1),
                    blurRadius: 10,
                  )
                ],
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                )),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 25),
                  width: 30,
                  height: 4,
                  decoration: const BoxDecoration(
                      color: Color(0xffD5DDE0),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                
                Container(
                  width: 333,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 3),
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10).copyWith(bottom: 4),
                        child: const Image(width: 30,
                          height: 30,
                          image: AssetImage('assets/ic_search.png'),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          );
        });
  }
}
