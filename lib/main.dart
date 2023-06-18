
import 'package:flutter/material.dart';
import 'package:tenor/tenor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'bigimage.dart';
import 'card.dart';



void main() async {

  runApp(const MyApp());
}

const String apiKeyTenor = 'LIVDSRZULELA';
Tenor tenor = Tenor(apiKey: apiKeyTenor);
List<SearchResult> _listOfCards = [];

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
  final dio = Dio();



  @override
  Widget build(BuildContext context) {
    SearchResult? searchResult;
    SearchResult? finishSearchResult;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  autofocus: true,
                  style: DefaultTextStyle.of(context).style.copyWith(
                     // fontStyle: FontStyle.italic
                  ),

               // style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
                  decoration: const InputDecoration(
                      hintText: 'Пошук картинок',
                      //helperText: 'Жодної картинки не знайдено',
                      hintStyle: TextStyle(height: 0.5, fontSize:20),
                      //DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
                      border: OutlineInputBorder()

                  ),
        //
      ),
                suggestionsCallback: (pattern) async {
                final response = await dio.get(
                    'https://g.tenor.com/v1/autocomplete?q=$pattern&key=LIVDSRZULELA');
                final jsonResponse = response.data;
                final results = jsonResponse['results'];
                return List<String>.from(results);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion)  async {
                //final SearchResult searchResult;
                TenorResponse? res = await tenor.searchGIF(suggestion, limit: 10);
                List<SearchResult> newResult = [];
                res?.results.forEach((TenorResult tenorResult) {
                  var title = tenorResult.title;
                  var media = tenorResult.media;
                  var searchResult = media?.gif?.previewUrl?.toString();

                  newResult.add( SearchResult(imageUrl: searchResult ?? '') );

                });

                setState(() {
                  _listOfCards = newResult;
                      },
                    );
                }
                ),
            SizedBox(
            child: Text(_listOfCards.isNotEmpty?'':'Жодної картинки не знайдено'),
            ),

            Expanded(
              child: SizedBox(
                height: 200.0,
               child: CardGrid(
                    searchResult: _listOfCards,
                 onTap: () async{
                   final newCardInfo = await Navigator.push<SearchResult>(
                       context,
                       MaterialPageRoute(
                           builder: (_) => AboutPage(searchResult: _listOfCards.first,
                           )
                       )
                   );
                   },
              ),
            ),
            ),
          ],
    )

      );
      }
}

class SearchResult{
  final String imageUrl;

  SearchResult({
      required this.imageUrl,});
}






