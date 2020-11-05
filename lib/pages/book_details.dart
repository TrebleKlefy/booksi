import 'package:booksi/model/bookInfo.dart';
import 'package:flutter/material.dart';

Widget titleSection(book) => Container(
  
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
               book.volumeInfo.publisher??'No Publisher',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             Text(
            book.volumeInfo.authors[0] ??'No Author ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.volumeInfo.publishedDate ??'No Published Date',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            
            Container(
              padding: const EdgeInsets.only(top: 30),
              
              child: Center(
                child: Text(
                 book.volumeInfo.subtitle??'No subtitle',
                softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    
                  ),
                ),
              ),
            ),
              Container(
              padding: const EdgeInsets.only(top: 20),
              
              child: Text(
               book.volumeInfo.description??'No description',
              softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
     
    ],
  ),
);




class BookDetails extends StatelessWidget {
  final Item book;
 
  BookDetails(this.book) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo.title ??'No Title'),
      ),
      body: ListView(
      
            children:<Widget> [
             Image.network(
                    book.volumeInfo.imageLinks.thumbnail??'No Thumbnil',
                width: 600,
                height: 200,
                  ),
              titleSection(book),
           
              
            
                
            ]
          ),
     
    );
  }
  
}
