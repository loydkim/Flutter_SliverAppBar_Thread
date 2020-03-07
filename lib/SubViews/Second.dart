import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class Second extends StatelessWidget {
  Second({
    Key key,
    this.appBarTitle,
    this.imageURL
  }) : super (key:key);

  final String appBarTitle;
  final String imageURL;

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _textController = new TextEditingController();

    Future<void> _handleSubmitted(String text) async {
      _textController.text = '';
      int randomNumber = Random().nextInt(10000);
      var randomID = 'ID${randomNumber}';
      var nowString = '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}';

      try {
        await Firestore.instance.collection('thread').document().setData({'content':text ,'userId':randomID, 'date':nowString});
      }catch(e){
        print(e.message);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message),
              );
            }
        );
      }
    }

    Widget _buildTextComposer() {
      return new IconTheme(                                            //new
        data: new IconThemeData(color: Theme.of(context).accentColor), //new
        child: new Container(                                     //modified
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Add a your comment.."),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text)),
              ),
            ],
          ),
        ),                                                             //new
      );
    }

    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('thread').snapshots(),
            builder: (context,snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    pinned: false,
                    snap: true,
                    flexibleSpace: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Image.network(imageURL,
                            height: 280,
                            width: size.width,
                            fit: BoxFit.fill),
                            Positioned(
                                top: 38,
                                left: size.width - 70,
                                child: Container(
                                  height: 28,
                                  width: 64,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.black,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,right: 6, top: 3,bottom: 3),
                                          child: Icon(Icons.favorite,
                                            size: 24,
                                            color: Colors.red,),
                                        ),
                                        Text( '11',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                    expandedHeight: 264,
                    backgroundColor: Colors.white,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        if (index == 0) {
                          return _buildTextComposer();
                        }else {
                          return Column(
                            children: <Widget>[
                              Divider(),
                              ListTile(
                                leading:
                                Icon(Icons.account_circle,
                                  size: 40,),
                                title: Column(
                                  children: <Widget>[
                                    Text(snapshot.data.documents[index-1].data['userId']),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(snapshot.data.documents[index-1].data['content']),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(snapshot.data.documents[index-1].data['date']),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                      childCount: (snapshot.data.documents.length+1),
                    ),
                  ),
                ],
              );
            }
        )
    );
  }
}