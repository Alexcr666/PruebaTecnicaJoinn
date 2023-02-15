import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/app/app_colors.dart';
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
import 'package:sizer/sizer.dart';

import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  //final RegistrationInteractor registrationInteractor;
  ///final String? phoneNumber;

  RegistrationUI();

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  final controllerName = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();
  final controllerFullName = TextEditingController();
  final controllerEmailAddress = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerIdentification = TextEditingController();
  String valueSelectedTitle = "Select Option";
  String valueSelectedId = "";

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors().icon, //change your color here
        ),
        backgroundColor: AppColors().backgroundColorAppBar,
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 25, color: AppColors.secondaryTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors().backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.vertical,
          child: Stack(children: [
            ListView(
              children: [
                SizedBox(
                  height: 20.sp,
                ),
                EntryField(
                  labelText: "Name",
                  controller: controllerName,
                  initialValue: '',
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  labelText: locale.fullName,
                  controller: controllerFullName,
                  initialValue: '',
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  labelText: locale.emailAddress,
                  controller: controllerEmailAddress,
                  initialValue: '',
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  labelText: locale.phoneNumber,
                  controller: controllerPhoneNumber,
                  initialValue: '',
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      color: AppColors().textfield,
                      borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                          ),
                    ),
                    child: ReduxLogin.store!.state.postsState.listIdentificationModel == null
                        ? SizedBox()
                        : new DropdownButtonHideUnderline(
                            child: DropdownButton<IdentificationListModel>(
                            isExpanded: true,
                            items: ReduxLogin.store!.state.postsState.listIdentificationModel!.map((IdentificationListModel value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value.name.toString()),
                              );
                            }).toList(),
                            hint: Container(
                              margin: EdgeInsets.only(
                                left: 20,
                              ),
                              child: Text(
                                valueSelectedTitle,
                                style: TextStyle(color: Colors.black, fontSize: 16),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            style: TextStyle(color: Colors.black, decorationColor: Colors.red),
                            onChanged: (value) {
                              valueSelectedId = value!.id.toString();
                              valueSelectedTitle = value.name.toString();
                              setState(() {});
                            },
                          ))),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  labelText: "Identification",
                  controller: controllerIdentification,
                  initialValue: '',
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  labelText: "Password",
                  controller: controllerPassword,
                  initialValue: '',
                  obscureText: true,
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  labelText: "Repeat password",
                  controller: controllerRepeatPassword,
                  initialValue: '',
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () {
                    //  widget.registrationInteractor.register('phoneNumber', 'name', 'email');
                    var api = endPointApi();

                    asinc() async {
                      Store<AppState> store = await createStore(api: api);

                      store.dispatch(UserSignUpAction(
                        context: context,
                        email: controllerEmailAddress.text,
                        password: controllerPassword.text,
                        name: controllerName.text,
                        lastname: controllerFullName.text,
                        identification: controllerIdentification.text,
                        identificationType: "1",
                        phone: controllerPhoneNumber.text,
                        imageUrl: "-",
                        state: "1",
                      ));
                    }

                    asinc();

                    /*    async() async {
                          // BuildContext? context = null;
                          Store<AppState> store = await createStore(api: endPointApi());

                          store.dispatch(getIdentificationTypeAction(context));
                          // store.dispatch(categoriesAction(_context, "2"));
                        }

                        async();*/
                  },
                  label: "Sin Up",
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(locale.wellSendVerificationOnGiven!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).hintColor, fontSize: 13)),
                Spacer(
                  flex: 5,
                ),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).backgroundColor, fontSize: 13),
                        children: <TextSpan>[
                      TextSpan(text: locale.bySigningUpYouAgreeToOur),
                      TextSpan(
                          text: locale.termsNConditions,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          )),
                    ])),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer.run(() {
      print("prueba45");
      async() async {
        // BuildContext? context = null;
        Store<AppState> store = await createStore(api: endPointApi());

        store.dispatch(getIdentificationTypeAction(context));
        // store.dispatch(categoriesAction(_context, "2"));
      }

      async();
    });
  }
}
