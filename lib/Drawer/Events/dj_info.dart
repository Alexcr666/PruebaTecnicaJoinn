import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:flutter/material.dart';

class DJInfoPage extends StatefulWidget {
  @override
  _DJInfoPageState createState() => _DJInfoPageState();
}

class _DJInfoPageState extends State<DJInfoPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Image.asset(
            Assets.djHeader,
            height: 280,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          PositionedDirectional(
            top: 130,
            child: FadedScaleAnimation(
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.play_arrow,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              durationInMilliseconds: 400,
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: FadedSlideAnimation(
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 240.0, left: 12, right: 12),
                    child: Column(
                      children: [
                        Container(
                          //    color: Colors.black,
                          padding: EdgeInsetsDirectional.fromSTEB(130, 20, 20, 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Skrillex',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                locale.americanMusicProducer!,
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                                child: RichText(
                                    text:
                                        TextSpan(style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18), children: <TextSpan>[
                                  TextSpan(text: '1.2M' + '\t\t'),
                                  TextSpan(text: locale.followers, style: Theme.of(context).textTheme.caption),
                                ])),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: CustomButton(
                                label: locale.followNow,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          // color: Colors.black,
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.about! + ' Skrillex',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium viverra laoreet. Praesent lacinia eros eget justo vestibulum, eu aliquet libero dictum.')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                                child: Row(
                                  children: [
                                    Text(locale.listenOn!, style: Theme.of(context).textTheme.caption),
                                    Expanded(
                                      child: Image.asset(
                                        Assets.soundCloud,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(12), color: Theme.of(context).backgroundColor),
                                child: Row(
                                  children: [
                                    Text(locale.listenOn!, style: Theme.of(context).textTheme.caption),
                                    Expanded(
                                      child: Image.asset(
                                        Assets.mixCloud,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.eventDetail);
                          },
                          child: Container(
                            decoration: BoxDecoration(color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                                  child: Text(
                                    locale.upcomingEvents!,
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 18),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                        child: Image.asset(
                                          Assets.event1,
                                          height: 175,
                                          fit: BoxFit.fill,
                                        )),
                                    Container(
                                      height: 175,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                                        Colors.black38,
                                        transparentColor,
                                        transparentColor,
                                      ])),
                                    ),
                                    Positioned.directional(
                                      textDirection: Directionality.of(context),
                                      start: 12,
                                      bottom: 12,
                                      child: Text(
                                        locale.bassHill!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(fontSize: 20, color: Theme.of(context).backgroundColor),
                                      ),
                                    )
                                  ],
                                ),
                                ListTile(
                                  dense: true,
                                  leading: Image.asset(
                                    Assets.djPin,
                                    scale: 4,
                                  ),
                                  title: Text(
                                    locale.randomDateTime!,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                                  ),
                                  subtitle: Text('2202, Marion St. Bass Hill, Amsterdam',
                                      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10)),
                                  trailing:
                                      Text('2.3 km ' + locale.away!, style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10)),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Spacer(
                                        flex: 5,
                                      ),
                                      ListView.builder(
                                          padding: EdgeInsets.only(bottom: 12),
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: dJays.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Blur(
                                                      blur: index == dJays.length - 1 ? 0.4 : 0,
                                                      blurColor: Theme.of(context).scaffoldBackgroundColor,
                                                      colorOpacity: index == dJays.length - 1 ? 0.4 : 0,
                                                      child: CircleAvatar(
                                                        radius: 10,
                                                        child: Image.asset(dJays[index]),
                                                      ),
                                                    ),
                                                  ),
                                                  index == dJays.length - 1
                                                      ? Text(
                                                          '5+',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .subtitle1!
                                                              .copyWith(fontSize: 11, color: Theme.of(context).backgroundColor),
                                                        )
                                                      : SizedBox.shrink()
                                                ],
                                              ),
                                            );
                                          }),
                                      Spacer(
                                        flex: 6,
                                      ),
                                      Text(
                                        '\$ 130.00',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Theme.of(context).primaryColor, fontSize: 18),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  PositionedDirectional(
                      top: 205,
                      start: 30,
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(12),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              Assets.dj1,
                              scale: 2.2,
                            )),
                      ))
                ],
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).backgroundColor,
                size: 18,
              ),
            ),
            trailing: Icon(
              Icons.share,
              size: 18,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
