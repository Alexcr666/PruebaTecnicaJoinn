import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Auth/Verification/UI/verification_interator.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:dj_mania/redux/sign_up/sign_up_actions.dart';
import 'package:dj_mania/services/endPoint.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:dj_mania/services/endPoint.dart';
import 'package:redux/redux.dart';
import 'package:dj_mania/app/app_settings.dart';

import 'package:dj_mania/redux/app/app_state.dart';
import 'package:dj_mania/redux/login/login_actions.dart';
import 'package:dj_mania/redux/login/login_state.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/redux/sign_up/sign_up_state.dart';
import 'package:dj_mania/redux/sign_up/store.dart';
import 'package:dj_mania/redux/store.dart';

import 'package:dj_mania/utils/alert.dart';

class RecuperatePasswordUI extends StatefulWidget {
  // final VerificationInteractor verificationInteractor;

  @override
  _RecuperatePasswordUIState createState() => _RecuperatePasswordUIState();

  // RecuperatePasswordUI(this.verificationInteractor);
}

class _RecuperatePasswordUIState extends State<RecuperatePasswordUI> {
  final TextEditingController _controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int _counter = 20;
  late Timer _timer;

  _startTimer() {
    _counter = 20; //time counter
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    // widget.verificationInteractor.verifyNumber();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(
                        flex: 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.primaryColor, fontSize: 24),
                              children: <TextSpan>[
                            TextSpan(text: "Recuperate Password"! + '\n'),
                            /* TextSpan(
                                text: locale.enter6DigitVerification,
                                style: TextStyle(height: 1.5, fontWeight: FontWeight.w300, fontSize: 16)),*/
                          ])),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                  top: MediaQuery.of(context).size.height * 0.24,
                  start: 16,
                  end: 16,
                  bottom: 20,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      EntryField(
                        labelText: "Email",
                        initialValue: '',
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        onTap: () {
                          if (emailController.text.trim().length != 0) {
                            async() async {
                              // BuildContext? context = null;
                              Store<AppState> store = await createStore(api: endPointApi());

                              store.dispatch(RecoveryPasswordAction(context!, emailController.text));
                              emailController.clear();
                              // store.dispatch(categoriesAction(_context, "2"));
                            }

                            async();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
