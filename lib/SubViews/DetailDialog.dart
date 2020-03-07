import 'package:flutter/material.dart';
import 'package:pageviewwithgrid/SubViews/Second.dart';

Widget DetailDialog(BuildContext context, String imageURL, String title, String explain) {
  ThemeData localTheme = Theme.of(context);

  return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(
            imageURL,
            fit: BoxFit.fill),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                title,
                style: localTheme.textTheme.display1,
              ),
              Text(
                explain,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_){
                          return Second(appBarTitle: title,imageURL: imageURL);
                        }));
                      },
                      child: const Text('Move Next Class'),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]
  );
}