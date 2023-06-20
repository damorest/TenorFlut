
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class StarData extends StatelessWidget {

  const StarData({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Улюблені картинки'),
        ),
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('favorites').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) return Text('Немає улюблених фото');
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            ),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
          return Card(
            //color: Colors.amber,
            child: Center(
              child: Container(
                child: Column(
                  children: [
                      Image.network(
                        '${snapshot.data!.docs[index].get('item')}',
                        width: double.infinity,
                        height: 140,
                        //fit:BoxFit.cover
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
                                    Share.share( "Подивись, яку класну картинку я знайшов: ${snapshot.data!.docs[index].get('item')} " ) ;
                                  },
                                  icon: const Icon(Icons.share),
                                  label: const Text('')),
                            ),
                            SizedBox(
                              width: 85.0,
                              height: 40.0,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection('favorites').doc(snapshot.data!.docs[index].id).delete();
                                  },
                                  icon: const Icon(Icons.delete_sweep),
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

        }


        );
      }
    ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Головна',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Улюблене',
          ),

        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => StarData(),
          //   ),
          // );

          print('index : $index');

        },
      ),
    );
      
  }

}