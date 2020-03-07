import 'package:flutter/material.dart';
import 'package:pageviewwithgrid/SubViews/DetailDialog.dart';

class MainGridList extends StatelessWidget {
  List<_Photo> _photos() {
    return [
      _Photo(imageURL: 'https://cdn.pixabay.com/photo/2017/06/09/09/39/adler-2386314_960_720.jpg',
          title: 'Eagle',
          subtitle: 'Eagle subtitle',
      explain: 'Eagle is the common name for many large birds of prey of the family Accipitridae. Eagles belong to several groups of genera, not all of which are closely related. Most of the 60 species of eagle are from Eurasia and Africa. Outside this area, just 14 species can be found—2 in North America, 9 in Central and South America, and 3 in Australia.'),
      _Photo(imageURL: 'https://cdn.pixabay.com/photo/2016/07/15/15/55/dachshund-1519374_960_720.jpg',
          title: 'Cute Dog',
          subtitle: 'cute cute',
      explain: 'The domestic dog (Canis lupus familiaris when considered a subspecies of the wolf or Canis familiaris when considered a distinct species) is a mammal, a member of the genus Canis (canines), which forms part of the wolf-like canids, and is the most widely abundant terrestrial carnivore.'),
      _Photo(imageURL: 'https://cdn.pixabay.com/photo/2016/05/02/13/17/wildlife-1367217_960_720.jpg',
          title: 'deer',
          subtitle: 'looks kind',
      explain: 'Deer (singular and plural) are the hoofed ruminant mammals formiobng the family Cervidae. The two main groups of deer are the Cervinae, including the muntjac, the elk (wapiti), the fallow deer, and the chital'),
      _Photo(imageURL: 'https://cdn.pixabay.com/photo/2020/02/05/15/19/zoo-4821484_960_720.jpg',
          title: 'mongoose',
          subtitle: 'hug',
      explain: 'Mongoose is the common English name for 29 of the 34 species in the family Herpestidae, which comprises 14 genera. They are small carnivorans native to southern Eurasia and mainland Africa. The remaining species of this family are native to Africa and comprise four kusimanses in the genus Crossarchus, and the meerkat Suricata suricatta.'),
      _Photo(imageURL: 'https://cdn.pixabay.com/photo/2012/10/06/22/18/horse-60153_960_720.jpg',
          title: 'Horse',
          subtitle: 'yummy',
      explain: 'The horse (Equus ferus caballus) is one of two extant subspecies of Equus ferus. It is an odd-toed ungulate mammal belonging to the taxonomic family Equidae. The horse has evolved over the past 45 to 55 million years from a small multi-toed creature, Eohippus, into the large, single-toed animal of today.'),
      _Photo(imageURL: 'https://cdn.pixabay.com/photo/2018/07/14/17/46/raccoon-3538081_960_720.jpg',
          title: 'Raccoon',
          subtitle: 'Boring',
      explain: 'The raccoon (/rəˈkuːn/ or US: /ræˈkuːn/ (About this soundlisten), Procyon lotor), sometimes spelled racoon, also known as the common raccoon, North American raccoon, northern raccoon, or coon, is a medium-sized mammal native to North America.'),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1,
            physics: ScrollPhysics(),
        shrinkWrap: true,
        children:_photos().map<Widget>( (photo) {

          return new GestureDetector(
            onTap: () => showDialog(
                context: context,
                builder: (context) => DetailDialog(context, photo.imageURL,photo.title,photo.explain)),
            child: _GridDemoPhotoItem(
              photo: photo,
            ),
          );
        }).toList()),
      ),
    );
  }
}

class _Photo {
  _Photo({
    this.imageURL,
    this.title,
    this.subtitle,
    this.explain
  });

  final String imageURL;
  final String title;
  final String subtitle;
  final String explain;
}

class GridSubject extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text('Normal List',
            style: TextStyle(fontFamily: 'ConcertOne-Regular',
                fontSize: 24,fontWeight: FontWeight.bold)),
      );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
        child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(photo.imageURL,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(4)),
          ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
        ),
      child: image,
      );
  }}