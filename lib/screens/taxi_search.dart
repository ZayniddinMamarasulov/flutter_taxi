import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchTaxi extends StatefulWidget {
  const SearchTaxi({Key? key}) : super(key: key);

  @override
  State<SearchTaxi> createState() => _SearchTaxiState();
}
final List<MapObject> mapObjects = [];
class _SearchTaxiState extends State<SearchTaxi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3E4958),
      body: Container(
        decoration:  const BoxDecoration(
            image:  DecorationImage(
              image:  AssetImage("assets/map.png"),
              fit: BoxFit.fill,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: RippleAnimation(
                  repeat: true,
                  color: const Color(0xff7EAB3A),
                  minRadius: 60,
                  ripplesCount: 6,
                  child: Image.asset("assets/car_top.png", height: 12, width: 12,),
                ),
              ),
              const Text("Looking for a taxi..."),
            ],
          ),
        ),
      ),
    );
  }
}
