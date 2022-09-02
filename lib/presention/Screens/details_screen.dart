import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';

class Detailes extends StatelessWidget {
  final Character character;

  const Detailes({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              expandedHeight: 600,
              stretch: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                    tag: character.charId!,
                    child: Image.network(
                      character.img!,
                      fit: BoxFit.cover,
                    )),
                title: Text(
                  character.nickname!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              )),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  displaydata('Catogry :  ', character.category!),
                  builddividor(270),
                  displaydata(
                      'Appearance :  ', character.appearance!.join(',')),
                  builddividor(240),
                ],
              ),
            ),
            SizedBox(
              height: 500,
            ),
          ]))
        ],
      ),
    );
    throw UnimplementedError();
  }

  Widget displaydata(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget builddividor(double endient) {
    return Divider(
      color: Color.fromARGB(255, 196, 7, 7),
      endIndent: endient,
    );
  }
}
