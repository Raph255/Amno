import 'package:amno/views/favorites_view.dart';
import 'package:amno/views/home_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(
      () { 
      setState(() {
      _currentIndex = _pageController.page!.round();
          }
        );
      }
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
            appBar: AppBar(
                title: const Text("Amno"),
                ),
            drawer: Drawer(
              child: Container(
                color:Colors.white,
                child : const Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text("Cours"),
                    ),
                    ListTile(
                      title: Text("Santé"),
                    )
                  ],
                )
              ),                   
            ) ,
            body: PageView(
              controller: _pageController,
              children: const [
                HomeView(),
                FavoritesView(),
              ],
              ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });

                _pageController.jumpToPage(_currentIndex);
              },
              items: const <BottomNavigationBarItem> [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favoris',
                )
                ]
              )
              , 
        ),
      );
  } 
}