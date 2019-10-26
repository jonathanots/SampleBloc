import 'dart:async';
import 'package:samplebloc/model/book_model.dart';

class BookBloc{

  List<BookModel> books = [
    BookModel(name: "Jonathan do Caribe"),
    BookModel(name: "Giovana do Caribe"),
  ];

  final StreamController<List<BookModel>> _streamController$ = StreamController<List<BookModel>>();
  Stream<List<BookModel>> get output => _streamController$.stream;


  addBook(String name){
    BookModel book = BookModel(name: name);
    books.add(book);
    _streamController$.add(books);
  }

  removeBook(String name){
    books.removeWhere((b) => b.name == name);
    _streamController$.add(books);
  }

}