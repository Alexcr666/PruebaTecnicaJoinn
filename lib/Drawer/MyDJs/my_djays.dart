import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:flutter/material.dart';

class MyDJays extends StatefulWidget {
  @override
  _MyDJaysState createState() => _MyDJaysState();
}

class MyDj {
  String image;
  String title;
  String? subtitle;

  MyDj(this.image, this.title, this.subtitle);
}

class _MyDJaysState extends State<MyDJays> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<MyDj> myDjayList = [
      MyDj(Assets.dj1, 'Skrillex', locale.americanMusicProducer),
      MyDj(Assets.dj2, 'DJ Booze', locale.americanMusicProducer),
      MyDj(Assets.dj3, 'Kelly James', locale.americanMusicProducer),
      MyDj(Assets.dj4, 'Opus Opera', locale.americanMusicProducer),
      MyDj(Assets.dj5, 'Rey Karthiyekar', locale.americanMusicProducer),
      MyDj(Assets.dj1, 'Skrillex', locale.americanMusicProducer),
      MyDj(Assets.dj2, 'DJ Booze', locale.americanMusicProducer),
      MyDj(Assets.dj3, 'Kelly James', locale.americanMusicProducer),
      MyDj(Assets.dj4, 'Opus Opera', locale.americanMusicProducer),
      MyDj(Assets.dj5, 'Rey Karthiyekar', locale.americanMusicProducer),
    ];
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        flexibleSpace: Image.asset(Assets.header),
        title: Text(
          locale.myDjs!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Theme.of(context).backgroundColor),
        ),
      ),
      body: FadedSlideAnimation(
        ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            itemCount: myDjayList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          myDjayList[index].image,
                          scale: 3,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myDjayList[index].title,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              myDjayList[index].subtitle!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: '1.2M ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 14)),
                              TextSpan(
                                  text: locale.followers,
                                  style: Theme.of(context).textTheme.caption),
                            ]))
                          ],
                        ),
                      ],
                    ),
                    PositionedDirectional(
                      end: 0,
                      bottom: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: followingBgColor),
                        child: Text(
                          locale.followings!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
