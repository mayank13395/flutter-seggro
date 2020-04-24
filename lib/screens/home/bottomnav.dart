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

class _BottomNav extends State<BottomNav>    {
  int index = 0;
  int selectedIndex = 0;

 
 
  List myColors = [Colors.red,Colors.yellow,Colors.green];
 
  

  List<NavigationItem> items = [
    NavigationItem(
        Icon(
          Icons.home,
          size: 20,
        ),
        Text('Home')
        ),
    NavigationItem(
        Icon(
          Icons.history,
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
    //  padding: EdgeInsets.only(left:40),
      height: 60,
     
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.white, blurRadius: 4)],
          border: Border(
      top: BorderSide(                    
        color: Colors.black45,
        width: 0.5,
      ),
    ),
          
          
          
          ),
      // color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return Expanded(
            
                      child: Material(
                               shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(50.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                                   child: InkWell(
                                      //  customBorder: new CircleBorder(),
                                       splashColor: Colors.grey,
                    
                          onTap: () {
                            setState(() {
                              selectedIndex = itemIndex;
                              print(selectedIndex);
                              widget.callback(selectedIndex);


                            });
                            print("icon Selected");
                          },
                          child: Container(
                            // color: myColors[itemIndex],
                          padding: EdgeInsets.only(left: 30,right: 0),

                            child: _buildItem(item, selectedIndex == itemIndex)
                            ),
                        ),
            ),
          );
        }).toList(),
      ),
    );
  }



    Widget _buildItem(NavigationItem item, bool isSelected) {


    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print("selected item..............$item.title");
    return Container(
 
      
        child: Stack(
          
          children: <Widget>[
         
             Container(
              //  height: 10,
              // color: Colors.black,
               
                            child: Visibility(
                 visible: isSelected,
                 
                child: _makeShadow(40.0,isSelected)
                
               ),
             ),
            
             Container(
              //  margin: EdgeInsets.only(top:10),
              //  padding: EdgeInsets.only(top: 10),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                    IconTheme(
              
                  data: IconThemeData(
                      // size: 16,
                      color: isSelected ? Colors.green : Colors.black),
                  child: item.icon,
                ),
                //  item.title,
                  DefaultTextStyle.merge(
                          style: TextStyle(  color:   isSelected?  Colors.green : Colors.black),
                          child: item.title
                          )
                 ],
               ),
             )
                     
                
                 
                // Text(item.t\\itle),
          ],
        )
        
        
       
        );
  }

   Widget _makeShadow(itemWidth,isSelect) {
    bool isSelected = isSelect;
    double height = isSelected ? 1.2 : 0;
    double width = isSelected ? itemWidth + 6 : 0;

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: height,
        width: width,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.elliptical(itemWidth , 0.1)),
    boxShadow: [
      const BoxShadow(
        color: Colors.green,
        // blurRadius: 2,
      ),
    ],
        ),
      );
  }

}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
