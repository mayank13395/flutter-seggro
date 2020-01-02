import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AskForPermission extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AskForPermission();
  }
  
}

class _AskForPermission  extends State<AskForPermission> {

Map<PermissionGroup,PermissionStatus>permissions;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }

  void getPermission()  async{
    permissions = await PermissionHandler().requestPermissions([

       PermissionGroup.camera,
       PermissionGroup.photos,
      //  PermissionGroup.location,
      //  PermissionGroup.storage

    ]);

  }


  @override
    Widget build(BuildContext context) {
    // TODO: implement build
    
    return  Scaffold(
      appBar: AppBar(
          title: Text('Ask for permisions'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("All Permission Granted"),
            ],
          )
        ),
      
    );
  }

  
}