import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/models/chrachterModel.dart';

class Oneitem extends StatelessWidget {
  final Character character;
  Oneitem(this.character);
  @override
  
  
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/ detailes', arguments: character);
          },
          child: Hero(
            tag: character.charId!,
            child: GridTile(
              child: Container(
                  color: Colors.grey,
                  child: (character.img != null)
                      ? FadeInImage(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder:
                              AssetImage('assets/890-loading-animation.gif'),
                          image: NetworkImage(character.img!))
                      : Image.asset('assets/replace.png')),
              footer: Container(
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${character.name}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ));
  }


 
}
