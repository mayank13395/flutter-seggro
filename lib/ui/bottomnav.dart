import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
   BottomNav({Key key, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }

  final IntCallback callback;

//  int selectedIndex = 0;
}

typedef void IntCallback(int val);

class _BottomNav extends State<BottomNav> {
  int index = 0;
  int selectedIndex = 0;
  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isSelected ? 120 : 30,
        // height: double.maxFinite,
        height: 40,
        padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.green)
            : null,
        //  color: Colors.brown,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                      // size: 16,
                      color: isSelected ? Colors.white : Colors.black),
                  child: item.icon,
                ),
                //  BoxDecoration(
                //    borderRadius:
                //  )
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: isSelected
                      ? DefaultTextStyle.merge(
                          style: TextStyle(color: Colors.white),
                          child: item.title)
                      : Container(),
                )
                //  item.icon,item.title
              ],
            ),
          ],
        ));
  }

  List<NavigationItem> items = [
    NavigationItem(
        Icon(
          Icons.home,
          size: 20,
        ),
        Text('Home')),
    NavigationItem(
        Icon(
          Icons.smoking_rooms,
          size: 20,
        ),
        Text('Previous')),
    NavigationItem(
        Icon(
          Icons.person,
          size: 20,
        ),
        Text('Account'))
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 35, right: 35),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.white, blurRadius: 4)]),
      // color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
                print(selectedIndex);
                widget.callback(selectedIndex);


              });
              print("icon Selected");
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
