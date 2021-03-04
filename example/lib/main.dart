/* Thanks to font_awesome_flutter and @brianegan for this example gallery
* https://github.com/fluttercommunity/font_awesome_flutter/blob/master/example/lib/main.dart
*/

import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

import 'package:fluttericon_example/src/icon_lists/all_icons.dart';

void main() {
  runApp(FontAwesomeGalleryApp());
}

class FontAwesomeGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Awesome Flutter Gallery',
      theme: ThemeData.light().copyWith(
        iconTheme: IconThemeData(size: 36.0, color: Colors.black87),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
      home: FontAwesomeGalleryHome(),
    );
  }
}

class FontAwesomeGalleryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FontAwesomeGalleryHomeState();
}

class FontAwesomeGalleryHomeState extends State<FontAwesomeGalleryHome> {
  var _searchTerm = "";
  var _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filteredIcons = allIcons
        .where((icon) =>
            _searchTerm.isEmpty ||
            icon.name.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: _isSearching ? _searchBar(context) : _titleBar(),
      body: GridView.builder(
        itemCount: filteredIcons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 4 : 6,
        ),
        itemBuilder: (context, index) {
          final icon = filteredIcons[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Hero(
                          tag: icon,
                          child: Icon(
                            icon.iconData,
                            size: 100,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(tag: icon, child: Icon(icon.iconData)),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Text(icon.family),
                      Text(icon.name),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _titleBar() {
    return AppBar(
      title: Text("Fluttericon Gallery"),
      actions: [
        IconButton(
            icon: Icon(Typicons.search),
            onPressed: () {
              ModalRoute.of(context)?.addLocalHistoryEntry(
                LocalHistoryEntry(
                  onRemove: () {
                    setState(() {
                      _searchTerm = "";
                      _isSearching = false;
                    });
                  },
                ),
              );

              setState(() {
                _isSearching = true;
              });
            })
      ],
    );
  }

  AppBar _searchBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Typicons.left_open),
        onPressed: () {
          setState(
            () {
              Navigator.pop(context);
              _isSearching = false;
              _searchTerm = "";
            },
          );
        },
      ),
      title: TextField(
        onChanged: (text) => setState(() => _searchTerm = text),
        autofocus: true,
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
