import 'package:trip/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
              page: 1,
              image: 'assets/images/one.jpeg',
              title: 'Yosemite National Park',
              description:
                  'Taman Nasional Yosemite terletak di pegunungan Sierra Nevada, California. Tempat ini terkenal dengan pohon sequoia raksasa yang telah berusia ribuan tahun serta pemandangan ikonik seperti Bridalveil Fall dan tebing granit El Capitan dan Half Dome yang megah.'),
          makePage(
              page: 2,
              image: 'assets/images/two.jpg',
              title: 'Golden Gate Bridge',
              description:
                  'Jembatan Golden Gate adalah jembatan gantung yang melintasi Selat Golden Gate, menghubungkan Teluk San Francisco dengan Samudra Pasifik. Struktur ini menjadi ikon kota dan dikenal sebagai salah satu karya arsitektur paling menakjubkan di dunia.'),
          makePage(
              page: 3,
              image: 'assets/images/three.jpg',
              title: 'Sedona',
              description:
                  "Sedona sering dianggap sebagai salah satu tempat terindah di Amerika. Lanskapnya yang penuh dengan warna-warna dramatis menjadikannya unik dan tak tertandingi, memikat siapa saja yang mengunjunginya."),
          makePage(
              page: 4,
              image: 'assets/images/four.jpg',
              title: 'Savannah',
              description:
                  "Savannah memiliki pesona unik dengan lumut Spanyol yang menghiasi pepohonannya, aksen khas Selatan, dan pekuburan tua yang menyeramkan. Kota ini, yang terletak sekitar 160 kilometer di selatan Charleston, Carolina Selatan, memiliki sisi eksentrik yang memikat."),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    FadeAnimation(
                        2,
                        Text(
                          page.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      '/' + totalPage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.5,
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                              Text(
                                '4.0',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                '(2300)',
                                style: TextStyle(
                                    color: Colors.white38, fontSize: 12),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              description,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7),
                                  height: 1.9,
                                  fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2.5,
                          Text(
                            'READ MORE',
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
