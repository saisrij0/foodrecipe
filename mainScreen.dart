import 'package:flutter/material.dart';
import 'package:foodrecipe/data/data.dart';
import 'package:foodrecipe/providers/favorite_provider.dart';
import 'package:foodrecipe/screens/fav_screen.dart';
import 'package:foodrecipe/screens/secondScreen.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavScreen()));
              },
              icon: Icon(Icons.favorite_outline, color: Colors.white),
            )
          ],
        ),
        body: Consumer<FavoriteProvider>(
            builder: (context, value, child) => GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 150,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  value.AddCategory(categories[index].id);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondscreen(
                                  s: categories[index].id,
                                  t: categories[index].name)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(categories[index].color),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          categories[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                })));
  }
}
