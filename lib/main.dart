import 'package:flutter/material.dart';
import 'package:hello_world/app_store/app_state.dart';
import 'package:hello_world/app_store/chat_provider.dart';
import 'package:provider/provider.dart';
import './pages/login/login.dart';
import 'package:event_bus/event_bus.dart';
const kHostUrl="https://3d31f8e6.ngrok.io";
//const kHostUrl="http://ec2-52-28-3-65.eu-central-1.compute.amazonaws.com";
 final EventBus eventBus =  EventBus();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      builder: (_) => AppState(),
      child: ChangeNotifierProvider<ChatProvider>(
          builder: (_) => ChatProvider(),
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.green[800],
                accentColor: Colors.green[600],
              ),
              home: LoginPage())),
    );
  }
}
