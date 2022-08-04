import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taxi/resource/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  double _panelHeightOpen = 0;

  final double _panelHeightClosed = 90.0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(

        fit: StackFit.expand,
        children: [
          Image.asset('assets/map.png'),
          Positioned(
            top: 50,
            left: 10,
            child: GestureDetector(
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
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlidingUpPanel(
                slideDirection: SlideDirection.UP,
                maxHeight: _panelHeightOpen,
                minHeight: _panelHeightClosed,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                panelSnapping: true,
                panelBuilder: (scrollController) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: AnimSearchBar(
                              // closeSearchOnSuffixTap: true,
                              color: AppColors.grey3StyleColor,
                              width: 350,
                              textController: searchController,
                              onSuffixTap: () {
                                setState(() {
                                  searchController.clear();
                                });
                              },
                            ),
                          ),
                          PlaceWidget('avenue Navoi, 15', 'Tashkent'),
                          PlaceWidget('avenue Navoi, 15', 'Tashkent'),
                          PlaceWidget('avenue Navoi, 15', 'Tashkent'),
                          PlaceWidget('avenue Navoi, 15', 'Tashkent'),
                          PlaceWidget('avenue Navoi, 15', 'Tashkent'),
                          PlaceWidget('avenue Navoi, 15', 'Tashkent'),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget PlaceWidget(String title, String subtitle) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.greyStyleColor,
            child: Icon(
              Icons.place,
              color: Colors.white,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          indent: 70,
          endIndent: 20,
          color: AppColors.greyStyleColor,
        ),
      ],
    );
  }
}
