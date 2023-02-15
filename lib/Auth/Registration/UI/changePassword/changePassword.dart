import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Auth/Verification/UI/verification_interator.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Auth/Registration/UI/changePassword/changePassword.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/data/model/auth/UserLoginModel.dart';
import 'package:dj_mania/data/model/auth/UserModelId.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:string_similarity/string_similarity.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:blur/blur.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Constants/constants.dart';
import 'package:dj_mania/Drawer/Calendar/calendarPage.dart';
import 'package:dj_mania/Drawer/Events/allEvents/allEvents2.dart';
import 'package:dj_mania/Drawer/Events/dj_info.dart';
import 'package:dj_mania/Drawer/Events/event_detail.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/Drawer/Profile/my_profile.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/OrderMapBloc/order_map_bloc.dart';
import 'package:dj_mania/OrderMapBloc/order_map_state.dart';
import 'package:dj_mania/Routes/routes.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/data/model/categories/categoriesListModel.dart';
import 'package:dj_mania/data/model/event/eventDetailsModel.dart';
import 'package:dj_mania/data/model/event/eventListModel.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:string_similarity/string_similarity.dart';

import 'package:dj_mania/data/model/auth/identificationType.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeActions.dart';
import 'package:dj_mania/redux/settingApp/settingsHomeState.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
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

final controllerChangePassword = TextEditingController();
final controllerChangePasswordRepeat = TextEditingController();

class ChangePasswordUI extends StatefulWidget {
//  final VerificationInteractor verificationInteractor;

  @override
  _ChangePasswordUIState createState() => _ChangePasswordUIState();

  // ChangePasswordUI(this.verificationInteractor);
}

class _ChangePasswordUIState extends State<ChangePasswordUI> {
  final TextEditingController _controller = TextEditingController();
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
      backgroundColor: AppColors().backgroundColor,
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                ),
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
                          color: AppColors().icon,
                          size: 25,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      RichText(
                          text: TextSpan(
                              style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).backgroundColor, fontSize: 24),
                              children: <TextSpan>[
                            TextSpan(text: "Change password" + '\n', style: TextStyle(color: AppColors().textColorGeneral)),
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
                        labelText: "Password",
                        initialValue: '',
                        controller: controllerChangePassword,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      EntryField(
                        labelText: "Password repeat",
                        initialValue: '',
                        controller: controllerRepeatPassword,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        label: "Guardar",
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        onTap: () {
                          // if (controllerChangePassword.text == controllerChangePasswordRepeat.text) {
                          async() async {
                            // BuildContext? context = null;
                            Store<AppState> store = await createStore(api: endPointApi());

                            store.dispatch(updatePasswordAction(context: context, id: "2", password: controllerChangePassword.text));
                            // store.dispatch(categoriesAction(_context, "2"));
                          }

                          async();
                          /*  } else {
                            AlertWidget().message(context, "Contraseña no coinciden");
                          }*/
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
