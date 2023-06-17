import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CardGrid extends StatelessWidget {
  //final SearchResult searchResult;

  const CardGrid(
      {super.key,
        });

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              //color: Colors.amber,
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Image.network(
                          'https://encrypted-tbn0.gstatic.com/'
                      'images?q=tbn:ANd9GcTeZh64y1w9MZ0jQZVEM4ixQPH6d7RiuZaKMFrFYui9jQ&s'),
                      Row(
                        children: [
                          ButtonBar(
                            children: [
                              SizedBox(
                                width: 85.0,
                                height: 50.0,
                                child: ElevatedButton.icon(
                                    // style: ElevatedButton.styleFrom(
                                    //     //primary: Colors.purple,
                                    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    //     textStyle: const TextStyle(
                                    //         fontSize: 5,)),
                                    // fontWeight: FontWeight.bold)),
                                    onPressed: () {},
                                    icon: const Icon(Icons.share),
                                    label: const Text('')),
                              ),
                              SizedBox(
                                width: 85.0,
                                height: 50.0,
                                child: ElevatedButton.icon(
                                    // style: ElevatedButton.styleFrom(
                                    //   //primary: Colors.purple,
                                    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    //     textStyle: const TextStyle(
                                    //         fontSize: 5,)),
                                    //         //fontWeight: FontWeight.bold)),
                                    onPressed: () {},
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
