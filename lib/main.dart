import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green[100], // status bar color
    ));
    return MaterialApp(
      color: Colors.green[100],
      debugShowCheckedModeBanner: false,
      title: 'Vyzi',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  MyStatefulWidgetState createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  String titleUni = "ВУЗы";
  String titleFav = "Избранное";
  String yourCity = "Ваш город";
  String yourScore = "Ваши баллы";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.green[100],
        title: Text(
          titleUni,
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {
              // call second tab with favourite universities
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: searchCityAndScoreWidget(),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: Color(0xffffffff),
              child: listViewWidget(),
            ),
          )
        ],
      ),
      drawer: Drawer(),
    );
  }

  Widget searchCityAndScoreWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 250.0,
              height: 48.0,
              child: Material(
                color: Colors.white,
                elevation: 16.0,
                borderRadius: BorderRadius.circular(32.0),
                shadowColor: Colors.black,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 16.0),
                    child: TextField(
                      cursorColor: Colors.green[400],
                      cursorRadius: Radius.circular(4.0),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Поиск",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 18.0,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 16.0,
                splashColor: Colors.green[200],
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 32.0,
                ),
                backgroundColor: Colors.green[400],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  yourCity,
                  style: TextStyle(
                    color: Color(0xff949B95),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Москва",
                  style: TextStyle(
                    color: Color(0xff4F5350),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            verticalDivider(),
            Column(
              children: <Widget>[
                Text(
                  yourScore,
                  style: TextStyle(
                    color: Color(0xff949B95),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "243",
                  style: TextStyle(
                    color: Color(0xff4F5350),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget listViewWidget() {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        uniCard(),
        uniCard(),
        uniCard(),
      ],
    );
  }

  Widget uniCard() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        //child: FittedBox(
        child: Material(
          color: Colors.white,
          elevation: 16.0,
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                      child: Image(
                        image: AssetImage('images/mgu.jpg'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: Icon(
                            Icons.star_border,
                            color: Colors.green[400],
                          ),
                          onPressed: null),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 8.0, bottom: 16.0),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "МГУ им. Ломоносова",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: verticalDivider(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "280",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[400]),
                            ),
                            Text(
                              "min ЕГЭ",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffA6A6A6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: verticalDivider(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "515k ₽",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green[400]),
                            ),
                            Text(
                              "min ₽ в год",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffA6A6A6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }

  Widget verticalDivider() {
    return Container(
      width: 1.0,
      height: 32.0,
      color: Color(0xffA6A6A6),
    );
  }
}

/*
* Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  yourCity,
                  style: TextStyle(
                    color: Color(0xff949B95),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Москва",
                  style: TextStyle(
                    color: Color(0xff4F5350),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            verticalDivider(),
            Column(
              children: <Widget>[
                Text(
                  yourScore,
                  style: TextStyle(
                    color: Color(0xff949B95),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "243",
                  style: TextStyle(
                    color: Color(0xff4F5350),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
* */
