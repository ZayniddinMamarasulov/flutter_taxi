import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_taxi/components/body.dart';
import 'package:flutter_taxi/components/drawer.dart';
import 'package:flutter_taxi/model/address.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var size = mediaQueryData.size;
    double horizontalPadding = size.width / 2 - 20;
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(size),
      bottomSheet: SlidingUpPanel(
        controller: PanelController(),
        minHeight: size.height * 0.3,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(
            30,
          ),
        ),
        header: buildHeader(horizontalPadding),
        panel: buildPanel(size),
        body: BuildBody(scaffoldKey: _scaffoldKey),
        panelBuilder: (scrollController) {
          return Container(

          );
        },
      ),
    );
  }

  Center buildHeader(double horizontalPadding) {
    return Center(
      child: Container(
        width: 30,
        height: 3,
        margin: EdgeInsets.only(
            top: 15, left: horizontalPadding, right: horizontalPadding),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(3),
          ),
        ),
      ),
    );
  }

  final List<Address> addresses = [
    Address(street: 'ул. Таубе, 15', city: 'Омск'),
    Address(street: 'ул. Старозагородная Роща, д. 8', city: 'Омск'),
    Address(street: '1-й Самарский переулок, д. 18', city: 'Омск'),
    Address(street: 'ул. Кирова, д. 20', city: 'Омск'),
  ];

  Widget buildPanel(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 21, right: 21),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.25),
                      blurRadius: 5,
                      offset: const Offset(0, 4))
                ]),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,

                ),
                constraints: BoxConstraints(maxHeight: size.height * 0.75),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 19),
                  child: Icon(
                    Icons.search,
                    color: Color(0xff7EAB3A),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Expanded(
            child: ListView.separated(
              itemCount: addresses.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(
                    addresses[index].street.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xff3E4958),
                    ),
                  ),
                  subtitle: Text(
                    addresses[index].city.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xff97ADB6),
                    ),
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff97ADB6)),
                    child: SvgPicture.asset(
                      'assets/icons/location.svg',
                      color: Colors.white,
                      height: 20,
                      width: 15,
                    ),
                  ),
                );
              },
              separatorBuilder: (context,index){
                return const Divider(
                  color: Colors.grey,
                  height: 1,
                  indent: 70,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}