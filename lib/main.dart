import 'package:flutter/material.dart';
import 'package:recipeapp/sample_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color color1 = Color(0xffB5192F);
  final Color color2 = Color(0xffE21F3D);
  final Color color3 = Color(0xffFE1949);
  final Color color4 = Color(0xffF0631C);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color3, color4],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  color: Colors.pink.shade800,
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                  ),
                  color: color2,
                ),
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                  ),
                  color: color1,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      _buildHeader(context),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Todays Special".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _itemBuilder(),
                      SizedBox(height: 40),
                      _itemBuilder(),
                      SizedBox(
                        height: 40,
                      ),
                      _itemBuilder()
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Search your Recipe",
                      fillColor: Colors.black87,
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _itemBuilder() {
    return Container(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return Container(
              margin: EdgeInsets.only(right: 15),
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            images[index % images.length],
                          ),
                          fit: BoxFit.cover,
                        )),
                    height: 150,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    name[index % name.length],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 40,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Food Hunt',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "Pokhara".toUpperCase(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(
            color: Colors.white,
          )),
          child: Text(
            "Order Now".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
