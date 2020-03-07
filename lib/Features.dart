import 'package:flutter/material.dart';
import 'package:pageviewwithgrid/SubViews/DetailDialog.dart';

class Features extends StatelessWidget {

  List<_FeaturePhoto> _feature() {
    return [
      _FeaturePhoto(imageURL: 'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492_960_720.jpg',
      title: 'Beatufil Cat',
      subtitle: 'I love cat',
      featureString: 'Feature1',
      explain: ' The cat (Felis catus) is a small carnivorous mammal. It is the only domesticated species in the family Felidae and often referred to as the domestic cat to distinguish it from wild members of the family. The cat is either a house cat, a farm cat or a feral cat; latter ranges freely and avoids human contact.Domestic cats are valued by humans for companionship and for their ability to hunt rodents. About 60 cat breeds are recognized by various cat registries.'),
      _FeaturePhoto(imageURL: 'https://cdn.pixabay.com/photo/2011/09/27/18/52/sparrow-9950_960_720.jpg',
          title: 'Loud bird',
          subtitle: 'sometimes the bird is loud',
          featureString: 'Feature2',
      explain: 'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterized by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton. Birds live worldwide and range in size from the 5 cm (2 in) bee hummingbird to the 2.75 m (9 ft) ostrich. There are about ten thousand living species, more than half of which are passerine, or "perching" birds. Birds have wings whose development varies according to species; the only known groups without wings are the extinct moa and elephant birds.'),
      _FeaturePhoto(imageURL: 'https://cdn.pixabay.com/photo/2016/12/04/21/58/rabbit-1882699_960_720.jpg',
          title: 'Rabbit',
          subtitle: 'She is cute',
          featureString: 'Feature3',
      explain: 'Rabbits are small mammals in the family Leporidae of the order Lagomorpha (along with the hare and the pika). Oryctolagus cuniculus includes the European rabbit species and its descendants, the worlds 305 breeds of domestic rabbit. Sylvilagus includes 13 wild rabbit species, among them the seven types of cottontail. The European rabbit, which has been introduced on every continent except Antarctica, is familiar throughout the world as a wild prey animal and as a domesticated form of livestock and pet.'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.0),
        children: _feature().map<Widget> ( (photo) {
          return new GestureDetector(
            onTap: () => showDialog(
                context: context,
            builder: (context) => DetailDialog(context, photo.imageURL, photo.title, photo.explain)),
            child: _FeatureGridItem(featurePhoto: photo),
          );
        }).toList()
      )
    );
  }
}

class _FeaturePhoto{
  _FeaturePhoto({
    this.imageURL,
    this.title,
    this.subtitle,
    this.featureString,
    this.explain
  });
  final String imageURL;
  final String title;
  final String subtitle;
  final String featureString;
  final String explain;
}

class _FeatureText extends StatelessWidget {
  const _FeatureText(this.text, this.fontSize);
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Text(text,
      style: TextStyle(fontFamily: 'ConcertOne-Regular',
      fontSize: fontSize)),
    );
  }
}

class _FeatureGridItem extends StatelessWidget {
  _FeatureGridItem({
    Key key,
    @required this.featurePhoto
  }) : super ( key: key);

  final _FeaturePhoto featurePhoto;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: <Widget>[
              Image.network(featurePhoto.imageURL,
              width: 230,
              height: 230,
              fit: BoxFit.cover),
              Positioned(
                  top: 16,
                  left: 140,
                  child: Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.black,//Color(0xff0F0F0F),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                          )
                        ]
                    ),
                    child: Center(
                      child: Text( featurePhoto.featureString,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
              )
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),

        ),
        _FeatureText(featurePhoto.title,16),
        _FeatureText(featurePhoto.subtitle,12),
      ]
    );
  }

}