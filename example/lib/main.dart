import 'package:flutter/material.dart';
import 'package:image_web_picker/imagePiker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var picker = ImagePickerWeb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: picker.image_memory == null
            ? Text('Image')
            : Image.memory(picker.image_memory),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          picker = await ImagePickerWeb().getImage();
          setState(() {});
        },
        child: Icon(Icons.image),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton.extended(
          label: Text('Upload To Firebase'),
          icon: Icon(Icons.cloud_upload),
          onPressed: () {
            uploadImageToFirebase(picker);
          },
        ),
      ),
    );
  }

  Future uploadImageToFirebase(ImagePickerWeb imagePickerWeb) async {
    // here your code to upload to firebase
    print(imagePickerWeb.image_upload);
  }
}
