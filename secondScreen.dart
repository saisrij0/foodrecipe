import 'package:flutter/material.dart';
import 'package:foodrecipe/providers/favorite_provider.dart';
import 'package:foodrecipe/screens/thirdScreen.dart';
import 'package:provider/provider.dart';

class Secondscreen extends StatelessWidget {
  String s, t;
  Secondscreen({super.key, required this.s, required this.t});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Consumer<FavoriteProvider>(
          builder: (context, value, child) => ListView.builder(
              itemCount: value.mp[s]!.length,
              itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.all(20),
                    height: 350,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.mp[s]![index].title),
                            IconButton(
                                onPressed: () {
                                  value.addMeals(value.mp[s]![index]);
                                },
                                icon: Icon(
                                    value.MealStatus(value.mp[s]![index])
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ThirdScreen(s: s, ind: index),
                                ));
                          },
                          child: Container(
                            height: 260,
                            width: MediaQuery.of(context).size.width - 20,
                            child: ClipRRect(
                              child: Image.network(
                                value.mp[s]![index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ));
              })),
    );
  }
}
