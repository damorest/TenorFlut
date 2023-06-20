import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'bigimage.dart';
import 'main.dart';

class CardGrid extends StatelessWidget {
  final List<SearchResult> searchResult;
  final VoidCallback onTap;

  const CardGrid(
      {super.key, required this.searchResult,
        required this.onTap,
        });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: searchResult.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              //color: Colors.amber,
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                  GestureDetector(
                    onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AboutPage(searchResult: searchResult[index],
                    ),
                  ),
                    );
                    },

                        child: Image.network(
                            searchResult[index].imageUrl,
                          width: double.infinity,
                          height: 140,
                            //fit:BoxFit.cover
                        ),
                      ),

                      Row(
                        children: [
                          ButtonBar(
                            children: [
                              SizedBox(
                                width: 85.0,
                                height: 40.0,
                                child: ElevatedButton.icon(
                                      onPressed: () {
                                      Share.share( "Подивись, яку класну картинку я знайшов: ${searchResult[index].imageUrl} " ) ;
                                    },
                                    icon: const Icon(Icons.share),
                                    label: const Text('')),
                              ),
                              SizedBox(
                                width: 85.0,
                                height: 40.0,
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      FirebaseFirestore.instance.collection('favorites').add({'item': searchResult[index].imageUrl});
                                    },
                                    icon: const Icon(Icons.star),
                                    label: const Text('')),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

}
void sharePressed(String mesage) {
  String mesage = '';
  Share.share(mesage);
}



