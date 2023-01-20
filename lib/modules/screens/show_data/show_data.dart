import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weighttask/modules/screens/home/home_screen.dart';

class ShowData extends StatefulWidget {
  ShowData({Key? key}) : super(key: key);
  static String showId = 'Showid';

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<String> docid = [];

  CollectionReference data = FirebaseFirestore.instance.collection('Weight');

  Future getdocid() async {
    await FirebaseFirestore.instance.collection('Weight').orderBy('data',descending: true).get().then((value) =>
        value.docs.forEach((element) {
          docid.add(element.reference.id);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdocid(),
        builder: ((context, snapshot) {
          return ListView.builder(
            itemCount: docid.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: export(docmentid:docid[index]),
              );
            },
          );
        }),
      ),
    );
  }


}

Widget export({required String docmentid}) {
  CollectionReference users = FirebaseFirestore.instance.collection('Weight');

  return FutureBuilder<DocumentSnapshot>(
    future: users.doc(docmentid).get(),
      builder: ((context, snapshot)
  {
    if (snapshot.connectionState == ConnectionState.done) {
      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
      return Row(
        children: [
          Text("${data['weight']}"),
          Spacer(),
          InkWell(child: Icon(Icons.delete),onTap: (){
            users.doc(docmentid).delete();
            Navigator.pushNamed(context, HomeScreen.homeid);
          },)
        ],
      );
      }
    return Text("loading...................");
          }
      ),
  );

}
