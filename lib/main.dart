import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_page_trial/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const LoginView(title: 'Flutter Login Page'),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
     return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('LOGIN TO YOUR APP',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.all(5.0),//outer
            padding: const EdgeInsets.all(5.0),//inner
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5.0)),
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    
              const Text('Username: '),
              const TextField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person))),
              
              
              const SizedBox(height: 12),
              const Text('Password: '),
              const TextField(
                  obscureText: true,
                  decoration:
                      InputDecoration(prefixIcon: Icon(Icons.security))),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  },
                  child: const Text('Login')),
            ]),
          ),
        ],
      ),
    );
  }
}