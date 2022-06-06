// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'big_app_text.dart';

class PopularMountains extends StatefulWidget {
  const PopularMountains({Key? key}) : super(key: key);

  @override
  State<PopularMountains> createState() => _PopularMountainsState();
}

class _PopularMountainsState extends State<PopularMountains>
    with TickerProviderStateMixin {
  List images = [
    "mountain4.jpeg",
    "mountain8.jpeg",
    "mountain9.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 70,
              ),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: const BigAppText(text: "Discover", size: 30)),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                  tabs: [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspiration",
                    ),
                    Tab(
                      text: "Emotions",
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.infinity,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10, top: 10),
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                "img/" + images[index],
                              ),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                              "img/" + images[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                              "img/" + images[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: BigAppText(text: "Explore more", size: 20)),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset =
        offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
