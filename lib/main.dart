import 'package:flutter/material.dart';
import 'package:tenor/tenor.dart';

void main() {
  runApp(const MyApp());
}
const String apiKeyTenor = 'LIVDSRZULELA';
Tenor tenor = Tenor(apiKey: apiKeyTenor);
final List<String> _listOfCards = [];

// Future autoSearch(String autoFind) async {
//
// // auto complete results
//   List<String> autoCompleted = await tenor.autoComplete(autoFind, limit: 5);
// }

Future resFind(String find) async {
  final FhotoResult fhotoResult;

// search Gif
  TenorResponse? res = await tenor.searchGIF(find, limit: 5);
  res?.results.forEach((TenorResult tenorResult) {
    var title = tenorResult.title;
    var media = tenorResult.media;
    print('$title: gif : ${media?.gif?.previewUrl?.toString()}');

    _listOfCards.add('${media?.gif?.previewUrl?.toString()}',
    );


  });


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tenor картинки'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final FhotoResult fhotoResult;
  //late final String textInput = 'cat';

  //var res = resFind('cat');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
       body:
       Column(
           children: [
              TextField(
                enabled: true,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Пошук картинок",
               ),
                onSubmitted: (text) {
                  //print("onSubmtted");
                  resFind('cat');


                  print('Введенный текст: $text');

                },
                  // onChanged: (text) {
                  //  // print("onChanged");
                  //   autoSearch(text);
                  //   print("Введенный текст: $text");
                  // },
             ),

               ListView.builder(
                       itemCount: 3,
                       itemBuilder: (context, index) {
                      return  Image.network('https://img.freepik.com/free-vector/sticker-template-cat-cartoon-character_1308-68148.jpg?size=626&ext=jpg');

                       }
                   ),

    ],
    ),

    );
  }
}

class FhotoResult {
  late String imageUrl;

  FhotoResult({
    required this.imageUrl
});
}
