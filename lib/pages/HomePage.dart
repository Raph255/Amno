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

  /// Permet de mettre à jour l'index de la page courante
  /// même si l'utilisateur fait glisser la page
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

  /// Eviter erreurs d'état du controleur
  /// et les fuites de mémoire
  @override
  void dispose() {
    _pageController.dispose();
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
              children: [
                HomeView(),
                const FavoritesView(),
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