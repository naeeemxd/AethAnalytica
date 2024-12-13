import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(home: BottomNav(),
  debugShowCheckedModeBanner: false,));
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}



class _BottomNavState extends State<BottomNav> {

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text('Search', style: TextStyle(color: Colors.white))),
    Center(child: Text('Reels', style: TextStyle(color: Colors.white))),
    Center(child: Text('Shopping', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF0C0F14),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              weight: 3,
            ),
            label: '',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
