import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/screens/drawer_screen.dart';
import 'package:flutter_taxi/utils/strings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../models/address.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late YandexMapController controller;

  Future<bool> get locationPermissionNotGranted async =>
      !(await Permission.location.request().isGranted);


  Future<void> checkPermission(BuildContext context) async {
    if (await locationPermissionNotGranted) {
      _showMessage(context, const Text("location permission was Not granted"));
      return;
    }
    final mediaQuery = MediaQuery.of(context);
    final height =
        _scaffoldKey.currentContext!.size!.height * mediaQuery.devicePixelRatio;
    final width =
        _scaffoldKey.currentContext!.size!.height * mediaQuery.devicePixelRatio;
    await controller.toggleUserLayer(
        visible: true,
        headingEnabled: true,
        autoZoomEnabled: true,
        anchor: UserLocationAnchor(
            course: Offset(0.5 * height, 0.5 * width),
            normal: Offset(0.5 * height, 0.5 * width)));
  }

  _showMessage(BuildContext context, Text text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.25,
        maxHeight: MediaQuery.of(context).size.height * 0.85,
        body: buildBody(),
        panel: buildPanel(context),
      ),
      drawer: const DrawerScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkPermission(context);
        },
      ),
    );
  }

  final List<MapObject> mapObjects = [];

  Row buildAppBar() {
    return Row(
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
        ),
      ],
    );
  }

  Stack buildBody() {
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
                            'assets/ic_user.png')))),
                arrow: view.arrow.copyWith(
                    icon: PlacemarkIcon.single(PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage(
                            'assets/ic_dest.png')))),
                accuracyCircle: view.accuracyCircle
                    .copyWith(fillColor: Colors.green.withOpacity(0.5)));
          },
          mapObjects: mapObjects,
          zoomGesturesEnabled: true,
        )),
        SafeArea(child: Expanded(child: buildAppBar())),
      ],
    );
  }

  Container buildPanel(context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 4,
              width: 32,
              color: const Color(0xffD5DDE0),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                setState(() {
                  showDialog(
                    barrierColor: const Color.fromRGBO(62, 73, 88, 0.9),
                    context: context,
                    builder: (context) => searchTaxi(),
                  );
                });
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: const BoxDecoration(
                  color: Color(0xff7EAB3A),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    stringTaxiSearch.tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff7EAB3A),
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: addressList()),
          ],
        ));
  }

  List<Address> addresses = [
    Address(street: stringStreetTaube.tr(), city: stringOmsk.tr()),
    Address(street: stringStreetStaro.tr(), city: stringOmsk.tr()),
  ];

  ListView addressList() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          indent: MediaQuery.of(context).size.width * 0.2,
          endIndent: MediaQuery.of(context).size.width * 0.05,
          thickness: 1,
          color: Colors.black38,
        );
      },
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffD5DDE0),
            child: Icon(
              Icons.place,
              color: Colors.white,
              size: 32,
            ),
          ),
          subtitle: Text(addresses[index].city ?? ""),
          title: Text(addresses[index].street ?? ""),
        );
      },
    );
  }

  searchTaxi() {
    return SimpleDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: RippleAnimation(
        repeat: true,
        minRadius: 70,
        ripplesCount: 3,
        duration: const Duration(seconds: 7),
        delay: const Duration(seconds: 0),
        color: const Color(0xffffffff),
        child: Center(
          child: Image.asset(
            height: 100,
            width: 100,
            'assets/car_top.png',
          ),
        ),
      ),
    );
  }
}
