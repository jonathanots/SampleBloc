import 'package:flutter/material.dart';
import 'package:samplebloc/bloc/book_bloc.dart';
import 'package:samplebloc/model/book_model.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  BookBloc bloc = BookBloc();
  TextEditingController _textController = TextEditingController();

  _buildList(){
    return StreamBuilder<List<BookModel>>(
      stream: bloc.output,
      initialData: bloc.books,
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, index){
            return ListTile(
              title: Text("${snapshot.data[index].name}"),
            );
          },
          
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banca de Livros"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Nome do livro",
                        border: OutlineInputBorder()
                      ),
                    )
                  ),
                  VerticalDivider(color: Colors.transparent,),
                  RaisedButton(
                    onPressed: (){
                      bloc.addBook(_textController.text);
                    },
                    child: Text("Adicionar"),
                  ),
                  VerticalDivider(color: Colors.transparent,),
                  RaisedButton(
                    onPressed: (){
                      bloc.removeBook(_textController.text);
                    },
                    child: Text("Remover"),
                  )
                ],
              ),
              Divider(),
              Expanded(
                child: _buildList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}