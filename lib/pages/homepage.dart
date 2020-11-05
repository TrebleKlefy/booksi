import 'dart:async';

import 'package:booksi/model/bookInfo.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:booksi/services/api_manager.dart';
import 'package:flutter/material.dart';

import 'book_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();

  Future<BookModel> _bookModel;
  var response;
  var string = "empty_string";

  initiateSearch(value) {
    if (value == "") {
      string = "empty_string";
      setState(() {
        _bookModel = APIManager().getBooks(string);
      });
    } else {
      // string = value;
      print(value);
      setState(() {
        _bookModel = APIManager().getBooks(value);
      });
    }
  }

  Future<void> fetchUserOrder() {
    // Imagine that this function is fetching user info from another service or database.
    return Future.delayed(Duration(seconds: 6), () => print('Large Latte'));
  }

  @override
  void initState() {
    _bookModel = APIManager().getBooks(string);

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      debugShowCheckedModeBanner: false,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Booksi'),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (text) {
                if (text == '') {
                  initiateSearch('empty_string');
                } else {
                  initiateSearch(text);
                }
              },
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<BookModel>(
              future: _bookModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (context, index) {
                        var books = snapshot.data.items[index];
                        return GestureDetector(
                          onTap: () {
                            //navigate to user details page
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                  builder: (context) => BookDetails(books),
                                ));
                          },
                          child: SingleChildScrollView(
                            child: Container(
                              height: 100,
                              child: Container(
                                height: 100,
                                margin: const EdgeInsets.all(8),
                                child: Row(
                                  children: <Widget>[
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Image.network(
                                            books.volumeInfo.imageLinks
                                                    .smallThumbnail ??
                                                'No Image',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    SizedBox(width: 16),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            books.volumeInfo.title ??
                                                'No Title',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            books.volumeInfo.authors[0] ??
                                                'No Author ',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            books.volumeInfo.publishedDate ??
                                                'No Published Date',
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                  child: Container(
                      width: 160,
                      height: 180,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(strokeWidth: 5,
                      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.grey),),
                            width: 80,
                            height: 80,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('Fetching Book List...'),
                          ),DelayedDisplay(
                        delay: Duration(seconds: 2),
                        child: Text(
                          "No results, please search again",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                        ],
                      )),
                );
                }
              },
            ),
          ),
        ]));
  }
}
