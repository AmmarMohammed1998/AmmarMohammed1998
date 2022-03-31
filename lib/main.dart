import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/registeration_scteen.dart';
import 'package:chatapp/screens/sigin_screen.dart';
import 'package:chatapp/screens/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class  MyApp extends StatelessWidget {
final _auth=FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message me',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home:ChatScreen(),
      initialRoute:_auth.currentUser !=null?ChatScreen.screenRoute:WelcomeScreen.screenRoute,
      routes:{
        WelcomeScreen.screenRoute:(context)=>const WelcomeScreen(),
        SignInScreen.screenRoute:(context)=>const SignInScreen(),
        RegistrationScreen.screenRoute:(context)=>const RegistrationScreen(),
        ChatScreen.screenRoute:(context)=>const ChatScreen(),
      } ,
    );
  }
}
