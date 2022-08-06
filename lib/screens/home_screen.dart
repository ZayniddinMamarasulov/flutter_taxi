import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_taxi/second_drawer-screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final controller = ScrollController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () {
          showMaterialModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            context: context,
            builder: (context) => DraggableScrollableSheet(
              maxChildSize: 0.9,
              minChildSize: 0.16,
              expand: false,
              initialChildSize: 0.6,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      SingleChildScrollView(
                controller: scrollController,
                child: Container(
                    child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: -15,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          width: 60,
                          height: 7,
                        )),
                    Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Eng oxirgi manzillar",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: "Manzilni kiriting",
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.search),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16))),
                            ),
                          ),
                        ),
                        placeList("Hilton"),
                        Divider(
                          color: Colors.black54,
                          indent: 50,
                        ),
                        placeList("Magic city"),
                        Divider(
                          color: Colors.black54,
                          indent: 50,
                        ),
                        placeList("Mediapark"),
                        Divider(
                          color: Colors.black54,
                          indent: 50,
                        ),
                        placeList("NBU"),
                        Divider(
                          color: Colors.black54,
                          indent: 50,
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            ),
          );
        },
        child: Icon(
          Icons.my_location_outlined,
          color: Colors.black,
        ),
      ),
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
            ],
          ),
        ),
      ),
      drawer: buildDrawer(context)
    );
  }

  Widget placeList(String place) {
    return ListTile(
      title: Text(
        place,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.pin_drop_outlined,
            size: 28,
          )),
    );
  }

  Widget buildDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondDrawerScreen()));
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.29,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: Color(0xff7cb342)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/men.jpg"),
                          radius: 36,
                        ),
                        SizedBox(height: 11,),
                        Text("Xondamir",style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                        SizedBox(height: 2,),
                        Text("O'skanov@yandex.ru",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  )
              ),
            ),
          ),
          buildListTile("Sayohat tarixi","",Colors.white38),
          buildListTile("To'lov usuli","",Colors.white38),
          buildListTile("Kupon kodi","1",Colors.white),
          buildListTile("Qo'llab-quvvatlsh","",Colors.white38),
        ],
      ),
    );
  }
  Widget buildListTile(String title, String text,Color color) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        trailing: CircleAvatar(
          backgroundColor: color,
          radius: 15,
          child: Text(text,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        ),
        title: Text(title.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}
