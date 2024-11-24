import 'package:flutter/material.dart';
import 'dart:io';
//import 'package:archive/archive_io.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme of the app
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.green, primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,

      // scaffold with app

      home: const MyHomePage(title: 'File Zipper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
   
    
    return Container(
    child: Row(
                  children: <Widget>[
                 Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          //        style: TextButton.styleFrom(minimumSize: const Size(10,10)),
                          child: const Text(
                            'Zip File(s)',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

			if (result != null) {
  			List<File> files = result.paths.map((path) => File(path!)).toList();
				for(final file in files){
				print("file is: ${file}");
				//String fileName = File(file).uri.pathSegments.last;
				//print("filename is: ${fileName}";
				//final filepath=file.path;
				/*final filename=file2.name;
				
				try {
    final zipFile = File("${filename.zip}");
    ZipFile.createFromDirectory(
        sourceDir: file.path, zipFile: zipFile, recurseSubDirs: false);
  } catch (e) {
    print(e);
  }
  */
				}
				
				} 
				else {
 					 return;
					}
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          //        style: TextButton.styleFrom(minimumSize: const Size(10,10)),
                          child: const Text(
                            'UnZip File',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                      return;
                          }),
                    ),
                  ],
                ),
    
    );
  }
}
