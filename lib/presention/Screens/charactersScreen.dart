import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_widgets/bussnis_logic/cubit/charachter_cubit.dart';
import 'package:flutter_widgets/data/models/chrachterModel.dart';
import 'package:flutter_widgets/presention/widgets/BuildItem.dart';

class charactersScreen extends StatefulWidget {
  @override
  State<charactersScreen> createState() => _charactersScreenState();
}

class _charactersScreenState extends State<charactersScreen> {
  late List<Character> allcharacters;
  late List<Character> searchedcharacters;
  final _searchcontroller = TextEditingController();
  bool isSearched = false;

  @override
  void initState() {
    allcharacters =
        BlocProvider.of<CharachterCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget offline() {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: .8, vertical: .8),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/offline.png"), fit: BoxFit.scaleDown),
      ),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Check your Internet..',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )),
    );
  }

  Widget FetchCharacters() {
    return BlocBuilder<CharachterCubit, CharachterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = (state).characters;
          return buildlistofcharacter();
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.redAccent,
          ));
        }
      },
    );
  }

  Widget buildlistofcharacter() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 2 / 3,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: _searchcontroller.text.isEmpty
                  ? allcharacters.length
                  : searchedcharacters.length,
              physics: ClampingScrollPhysics(),
              itemBuilder: ((BuildContext ctx, int index) {
                return _searchcontroller.text.isEmpty
                    ? Oneitem(allcharacters[index])
                    : Oneitem(searchedcharacters[index]);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildtextfiled() {
    return TextFormField(
      controller: _searchcontroller,
      decoration: InputDecoration(hintText: 'Find A Character....'),
      onChanged: ((searchedCharacter) {
        listofsearchedCharacters(searchedCharacter);
      }),
    );
  }

  void listofsearchedCharacters(String searchedCharacter) {
    searchedcharacters = allcharacters
        .where((charcter) =>
            charcter.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();

    setState(() {});
  }

  Widget buildAppbarTitle() {
    return isSearched ? buildtextfiled() : Text('Breakingbad');
  }

  List<Widget> buildAppbaraction() {
    if (isSearched == true) {
      return [
        IconButton(
            onPressed: () {
              _clearsearching();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearch();
            },
            icon: const Icon(Icons.search))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearched = true;
    });
  }

  void stopSearch() {
    _clearsearching();
    setState(() {
      isSearched = false;
    });
  }

  void _clearsearching() {
    setState(() {
      _searchcontroller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: buildAppbarTitle(),
          //leading:
          actions: buildAppbaraction(),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return FetchCharacters();
            } else {
              return offline();
            }
          },
          child: Container(),
        ));
  }
}
