import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodrecipe/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatelessWidget {
  String s;
  int ind;
  ThirdScreen({super.key, required this.s, required this.ind});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: Consumer<FavoriteProvider>(
          builder: (context, value, child) => SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.network(
                    value.mp[s]![ind].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value.mp[s]![ind].title),
                    IconButton(
                        onPressed: () {
                          value.addMeals(value.mp[s]![ind]);
                        },
                        icon: Icon(
                            value.MealStatus(value.mp[s]![ind])
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red))
                  ],
                ),
              ),
              ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.orange),
                  child: Center(
                      child: Text(value.mp[s]![ind].id,
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
                trailing: Text(value.mp[s]![ind].complexity),
                title: Text(
                  value.mp[s]![ind].affordability,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle:
                    Text("Duration ${value.mp[s]![ind].duration} Minutes"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text("Ingredients",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Flex(
                  direction: Axis.horizontal,
                  children: List.generate(
                      value.mp[s]![ind].ingredients.length,
                      (indx) => Card(
                            color: Colors.grey,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  10.0), // Adjust the padding as needed
                              child: Center(
                                child: Text(
                                  value.mp[s]![ind].ingredients[indx],
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text("Steps to Prepare",
                        style: TextStyle(color: Colors.orange, fontSize: 20)),
                  ],
                ),
              ),
              for (int i = 0; i < value.mp[s]![ind].steps.length; i++)
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          "${i + 1}. ${value.mp[s]![ind].steps[i]}",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          )),
        ));
  }
}
