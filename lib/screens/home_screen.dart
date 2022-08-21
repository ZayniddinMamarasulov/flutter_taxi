import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/models/address.dart';
import 'package:flutter_taxi/screens/sign_in_screen.dart';
import 'package:flutter_taxi/screens/taxi_search.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late YandexMapController controller;

  GlobalKey mapKey = GlobalKey();

  Future<bool> get locationPermissionNotGranted async =>
      !(await Permission.location.request().isGranted);

  @override
  void initState() {
    super.initState();
  }

  Future<void> checkPermission(BuildContext context) async {
    if (await locationPermissionNotGranted) {
      _showMessage(context, Text('Location permission was NOT granted'));
      return;
    }

    await controller.toggleUserLayer(
        visible: true,
        autoZoomEnabled: true,
        anchor: const UserLocationAnchor(
            course: Offset(0.5 * 2, 0.5 * 2),
            normal: Offset(0.5 * 2, 0.5 * 2)));
  }

  void _showMessage(BuildContext context, Text text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // ignore: sort_child_properties_last
        child: buildDrawer(),
        backgroundColor: const Color(0xffFFFFFF),
      ),
      body: InkWell(
        onTap: () {},
        child: SlidingUpPanel(
          minHeight: MediaQuery.of(context).size.height * 0.04,
          maxHeight: MediaQuery.of(context).size.height * 0.5,
          body: buildBody(),
          panel: buildPanel(),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
      ),

    );

  }

  Widget buildAppBAr() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _scaffoldKey.currentState?.openDrawer(),
          child: Container(
            margin: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8)
                ]),
               child: Image.asset("assets/ic_menu.png"),
          ),
        ),
      ],
    );
  }

  Widget buildDrawer() {
    return ListView(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.379,
        child: DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xff7EAB3A),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/user.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Davron",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Udalovea@yandex.ru",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        child: Column(
          children: [
             ListTile(
              title: Text(
                "Travel history".tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
             ListTile(
              title: Text(
                "Payment method".tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            ListTile(
              title: Text(
                "Promo code".tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 7)
                    ]),
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
             ListTile(
              title: Text(
                "Support".tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  saveLogin();
                  // final isValid = formKey.currentState?.validate();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SignIn()),
                      (Route<dynamic> route) => false);
                });
              },
              child: ListTile(
                title: Text(
                  "Log Out".tr(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      color: Color(0xff7EAB3A)),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  double sizeOfPanel = 0.05;

  Widget currentLocation(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * sizeOfPanel),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: MediaQuery.of(context).size.height * 0.05),
                height: MediaQuery.of(context).size.height * 0.07,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: IconButton(onPressed: (){
                      checkPermission(context);
                    }, icon: const Icon(Icons.my_location, color: Colors.black,)),
              ),)
            ],
          )
        ],
      ),
    );
  }

  final List<MapObject> mapObjects = [];

  Widget buildBody() {
    return Stack(
      children: [
        Expanded(
          child: YandexMap(
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;
            },
            onUserLocationAdded: (UserLocationView view) async {
              return view.copyWith(
                  pin: view.pin.copyWith(
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              'assets/ic_pick.png')))),
                  arrow: view.arrow.copyWith(
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              'assets/ic_pick.png')))),
                  accuracyCircle: view.accuracyCircle
                      .copyWith(fillColor: Colors.green.withOpacity(0.5)));
            },
            mapObjects: mapObjects,
            zoomGesturesEnabled: true,
          ),
        ),
        SafeArea(child: buildAppBAr()),
        currentLocation(context),
      ],
    );
  }

  Widget buildPanel() {
    return Container(
      padding: EdgeInsets.only(top: 13),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 32,
            color: Color(0xffD5DDE0),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
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
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.07, vertical: 18),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      // final isValid = formKey.currentState?.validate();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchTaxi()));
                    });
                  },
                  child: const Text("Order a taxi"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 7)
                ]),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff7EAB3A),
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(24))),
            ),
          ),
          Expanded(child: addressList()),
        ],
      ),
    );
  }

  List<Address> addresses = [
    Address(street: "ул. Таубе, 15", city: "Омск"),
    Address(street: "ул. Старозагородная Роща, д. 8", city: "Омск"),
  ];

  Widget addressList() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          indent: MediaQuery.of(context).size.width * 0.2,
          endIndent: MediaQuery.of(context).size.width * 0.1,
          height: 2,
          color: Colors.black45,
        );
      },
      itemCount: 2,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.place,
              color: Colors.white,
              size: 32,
            ),
            backgroundColor: Color(0xffD5DDE0),
          ),
          subtitle: Text(addresses[index].city ?? ""),
          title: Text(addresses[index].street ?? ""),
        );
      },
    );
  }

  void saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogIn", false);
  }
}
