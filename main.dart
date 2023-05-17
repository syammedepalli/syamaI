import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(CameraScreen());
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late String _imageURL; // Holds the URL of the image with recognized faces

  @override
  void initState() {
    super.initState();
    _startRecognition();
  }

  void _startRecognition() async {
    while (true) {
      final imageURL = await _getRecognizedImage();
      setState(() {
        _imageURL = imageURL!;
      });
      await Future.delayed(Duration(seconds: 1)); // Delay between requests
    }
  }

  Future<String?> _getRecognizedImage() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/add'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _imageURL != null
              ? Image.network(
                  _imageURL) // Display the image with recognized faces
              : Container(), // Placeholder or loading indicator if no image available
          // Overlay other widgets on top of the image as needed
        ],
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
//
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Retrieve the available cameras
//   final cameras = await availableCameras();
//
//   // Initialize the first camera
//   final camera = cameras.first;
//
//   runApp(MyApp(camera: camera));
// }
//
// class MyApp extends StatelessWidget {
//   final CameraDescription camera;
//
//   const MyApp({super.key, required this.camera});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter AI Facial Camera',
//       home: MyHomePage(camera: camera),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   final CameraDescription camera;
//
//   const MyHomePage({super.key, required this.camera});
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the camera controller
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.high,
//     );
//
//     // Initialize the camera controller future
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the camera controller when the widget is disposed
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter AI Facial Camera'),
//       ),
//       body: Column(
//         children: [
//           FutureBuilder<void>(
//             future: _initializeControllerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 // If the camera is initialized, display the camera preview
//                 return CameraPreview(_controller);
//               } else {
//                 // Otherwise, display a loading spinner
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//
//           ElevatedButton(onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewPage()));
//           }, child: const Text('Open'),
//           )
//         ],
//
//       ),
//     );
//   }
// }
//
// class NewPage extends StatelessWidget{
//   const NewPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: SafeArea(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           }, child: Text('Back'),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
//
// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter AI Facial Camera',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     home: const FacialCameraScreen(),
//   ));
// }
//
//
// class FacialCameraScreen extends StatelessWidget {
//   const FacialCameraScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Facial Camera Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CameraPage()),
//             );
//           },
//           child: const Text('Open AI Facial Camera'),
//         ),
//       ),
//     );
//   }
// }
//
// class CameraPage extends StatefulWidget {
//   const CameraPage({super.key});
//
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   Future<void> openCamera() async {
//     final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
//     // Handle the response or any error conditions here
//     // You can use the response data as needed
//
//     // Redirect to the next page after API call
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => NextPage()),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     openCamera();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Camera Page'),
//       ),
//       body: const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
//
// class NextPage extends StatelessWidget {
//   const NextPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Next Page'),
//       ),
//       body:
//       const Center(
//         child: Text('Next Page Content'),
//       ),
//     );
//   }
// }
//




// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   void initState() {
//     super.initState();
//     _navigateSplash();
//   }
//   _navigateSplash() async {
//     await Future.delayed(const Duration(milliseconds: 100))
//         .then((value) => {FlutterNativeSplash.remove()});
//   }
//
//   String postResponse = '';
//   String getResponse = '';
//
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('http://127.0.0.1:5000/add'));
//
//     if (response.statusCode == 200) {
//       setState(() {
//         getResponse = response.body;
//       });
//     } else {
//       // Handle error response
//       print('GET Error: ${response.statusCode}');
//     }
//   }
//
//   Future<void> postData() async {
//     final response = await http.post(
//       Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//       body: jsonEncode({
//         'title': 'Flutter POST Request',
//         'body': 'This is a sample POST request in Flutter.',
//         'userId': 1,
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 201) {
//       setState(() {
//         postResponse = response.body;
//       });
//     } else {
//       // Handle error response
//       print('POST Error: ${response.statusCode}');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('API Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: fetchData,
//               child: Text('GET Data'),
//             ),
//             SizedBox(height: 20),
//             if (getResponse.isNotEmpty)
//               Text('GET Response: $getResponse')
//             else
//               Text('No GET Response'),
//             SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: postData,
//               child: Text('POST Data'),
//             ),
//             SizedBox(height: 20),
//             if (postResponse.isNotEmpty)
//               Text('POST Response: $postResponse')
//             else
//               Text('No POST Response'),
//           ],
//         ),
//       ),
//     );
//   }
// }
