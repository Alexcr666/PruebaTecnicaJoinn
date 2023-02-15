import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:dj_mania/Assets/assets.dart';
import 'package:dj_mania/Auth/Registration/UI/changePassword/changePassword.dart';
import 'package:dj_mania/Components/custom_button.dart';
import 'package:dj_mania/Components/entry_field.dart';
import 'package:dj_mania/Drawer/TnC/tnc.dart';
import 'package:dj_mania/Drawer/app_drawer.dart';
import 'package:dj_mania/Drawer/pay/payTickets.dart';
import 'package:dj_mania/Locale/locale.dart';
import 'package:dj_mania/Theme/colors.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/data/model/auth/UserLoginModel.dart';
import 'package:dj_mania/data/model/auth/UserModelId.dart';
import 'package:dj_mania/redux/login/store.dart';
import 'package:dj_mania/sharedPreferences/sharePreferences.dart';
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

import 'package:sizer/sizer.dart';
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

import '../../map_utils.dart';

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

import '../../map_utils.dart';

final controllerName = TextEditingController();
final controllerPassword = TextEditingController();
final controllerRepeatPassword = TextEditingController();
final controllerFullName = TextEditingController();
final controllerEmailAddress = TextEditingController();
final controllerPhoneNumber = TextEditingController();
final controllerPhoneIdentification = TextEditingController();
bool _switchValue = false;

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

BuildContext? _context;
String valueProfile = "Select identification";
String valueProfileId = "Select identification";

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    _context = context;
    var imageTemp = null;
    var locale = AppLocalizations.of(context)!;
    return StoreProvider<AppStateHome>(
        store: ReduxHome.store!,
        child: StoreConnector<AppStateHome, dynamic>(
            converter: (store) => store.state.postsState,
            distinct: true,
            builder: (context, value) {
              UserModelIdModel? dataUser;
              if (ReduxHome.store!.state.postsState.userModelIdModel != null) {
                print("prueba56:--- " + ReduxLogin.store!.state.postsState.userModelIdModel!.firstName.toString());
                dataUser = ReduxHome.store!.state.postsState.userModelIdModel;
                controllerName.text = dataUser!.firstName ?? "";
                controllerFullName.text = dataUser.firstName ?? "";
                controllerEmailAddress.text = dataUser.email ?? "";
                controllerPhoneIdentification.text = dataUser.identification ?? "";
                controllerPhoneNumber.text = dataUser.phoneNumber ?? "";
              }

              return Scaffold(
                backgroundColor: AppColors().backgroundColor,
                //drawer: AppDrawer(),
                /*appBar: AppBar(
                  backgroundColor: AppColors().backgroundColorAppBar,
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 25, color: AppColors.secondaryTextColor, fontWeight: FontWeight.bold),
                  ),
                ),*/
                appBar: AppWidgetSize().appBar(title: "Edit profile"),
                body: ListView(
                  //  alignment: Alignment.topCenter,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        /*  GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 20, top: 10),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 40,
                                ))),*/
                        Expanded(child: SizedBox()),
                        GestureDetector(
                            onTap: () {
                              AppSharedPreference().clearDataUser(context).then((value) {
                                // Phoenix.rebirth(context);
                                //  Navigator.pushNamed(context, PageRoutes.loginPage);
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.logout,
                                  color: AppColors().icon,
                                  size: 35,
                                ))),
                      ],
                    ),
                    /*Text(
                      ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl.toString(),
                      style: TextStyle(color: Colors.white),
                    ),*/
                    PositionedDirectional(
                      top: 30,
                      child: GestureDetector(
                          onTap: () {
                            print("prueba45");
                            print("click");

                            /*  async() async {
                                // BuildContext? context = null;
                                Store<AppState> store = await createStore(api: endPointApi());

                                store.dispatch(getUserIdAction(context: _context!, id: "2"));
                                // store.dispatch(categoriesAction(_context, "2"));
                              }

                              async();*/

                            AppWidgetSize().alertCamera(context, tap1: () {
                              Navigator.pop(context);

                              ReduxLogin.store?.dispatch(
                                SetPostsStateActionLogin(
                                  PostsStateLogin(imageUserProfile: File("")),
                                ),
                              );

                              File _image;
                              final picker = ImagePicker();

                              Future getImage() async {
                                final pickedFile = await picker.getImage(source: ImageSource.gallery);

                                setState(() {
                                  if (pickedFile != null) {
                                    _image = File(pickedFile.path);
                                    ReduxLogin.store?.dispatch(
                                      SetPostsStateActionLogin(
                                        PostsStateLogin(imageUserProfile: _image),
                                      ),
                                    );
                                    print("image: " + _image.path.toString());
                                  } else {
                                    print('No image selected.');
                                  }
                                });
                              }

                              getImage();
                            }, tap2: () async {
                              Navigator.pop(context);
                              try {
                                final image = await ImagePicker().pickImage(source: ImageSource.camera);
                                if (image == null) return;
                                imageTemp = File(image.path);
                                setState(() {});

                                ReduxLogin.store?.dispatch(
                                  SetPostsStateActionLogin(
                                    PostsStateLogin(imageUserProfile: imageTemp),
                                  ),
                                );
                                print("pruebaimage---" + imageTemp.toString());
//setState(() => this.image = imageTemp);
                              } on PlatformException catch (e) {
                                print('Failed to pick image: $e');
                              }
                            });
                          },
                          child: dataUser == null
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                                  backgroundColor: AppColors.primaryColor,
                                )
                              : Column(
                                  children: [
                                    ReduxHome.store!.state.postsState.userModelIdModel == null
                                        ? CircleAvatar(
                                            radius: 60,
                                            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                                            backgroundColor: AppColors.primaryColor,
                                          )
                                        : ReduxLogin.store!.state.postsState.imageUserProfile != null
                                            ? Container(
                                                height: 100,
                                                width: 100,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: Image.file(
                                                      File(ReduxLogin.store!.state.postsState.imageUserProfile!.path),
                                                      fit: BoxFit.cover,
                                                    )))
                                            : ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl != null
                                                ? CircleAvatar(
                                                    radius: 60,
                                                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                                                    backgroundColor: AppColors.primaryColor,
                                                  )
                                                : AppWidgetSize()
                                                    .imageUrlS3(ReduxHome.store!.state.postsState.userModelIdModel!.imageUrl.toString())
                                  ],
                                )

                          /*Column(
                                    children: [
                                      Container(
                                          height: 120,
                                          //margin: EdgeInsets.only(left: 130, right: 130),
                                          width: 120,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(80),
                                              child: Container(
                                                  //margin: EdgeInsets.only(left: 130, right: 130),
                                                  width: 140,
                                                  child: ReduxLogin.store!.state.postsState.imageUserProfile != null
                                                      ? Image.file(File(ReduxLogin.store!.state.postsState.imageUserProfile!.path))
                                                      : AppWidgetSize().imageUrlS3(dataUser.imageUrl.toString())))),
                                    ],
                                  )*/
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PositionedDirectional(
                      top: 80,
                      child: Text(
                        'Chage photo profile',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
                          child: Column(
                            children: [
                              EntryField(
                                labelText: "Name",
                                controller: controllerName,
                                initialValue: '',
                              ),
                              /*   SizedBox(
                                  height: 12,
                                ),
                                EntryField(
                                  labelText: "Password",
                                  controller: controllerPassword,
                                  initialValue: '',
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                EntryField(
                                  labelText: "Repeat password",
                                  controller: controllerRepeatPassword,
                                  initialValue: '',
                                ),*/
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
                              EntryField(
                                labelText: "Identification",
                                controller: controllerPhoneIdentification,
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
                                    : DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                        items: ReduxLogin.store!.state.postsState.listIdentificationModel!
                                            .map((IdentificationListModel value) {
                                          return DropdownMenuItem(
                                            value: value.id.toString(),
                                            child: Text(
                                              value.name.toString(),
                                              //style: TextStyle(color: AppColors().textColorGeneral),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          valueProfile = ReduxLogin
                                              .store!.state.postsState.listIdentificationModel![(int.parse(value!) - 2)].name
                                              .toString();
                                          valueProfileId = ReduxLogin
                                              .store!.state.postsState.listIdentificationModel![(int.parse(value!) - 2)].id
                                              .toString();
                                          //   valueProfile = value!;
                                          setState(() {});
                                        },
                                        hint: Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            valueProfile,
                                            style: TextStyle(color: AppColors().textColorGeneral),
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        style: TextStyle(color: Colors.black, decorationColor: Colors.red),
                                      )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(children: [
                                Text(ReduxHome.store!.state.postsState.theme != true ? "DARK" : "LIGHT",
                                    style: TextStyle(color: AppColors().textColorGeneral.withOpacity(0.5), fontSize: 12.sp)),
                                CupertinoSwitch(
                                  activeColor: AppColors.primaryColor,
                                  value: ReduxHome.store!.state.postsState.theme!,
                                  onChanged: (value) {
                                    setState(() {
                                      ReduxHome.store?.dispatch(
                                        SetPostsStateActionHome(
                                          PostsStateHome(theme: value),
                                        ),
                                      );
                                      // _switchValue = value;
                                    });
                                  },
                                ),
                              ]),
                              Row(
                                children: [
                                  Expanded(child: SizedBox()),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ChangePasswordUI()),
                                        );
                                      },
                                      child: Text(
                                        "Cambiar contraseña",
                                        style: TextStyle(color: AppColors().textColorGeneral, fontSize: 16),
                                        textAlign: TextAlign.end,
                                      )),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(child: SizedBox()),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => TnCPage()),
                                        );
                                        /* Navigator.push(
                                          context!,
                                          MaterialPageRoute(builder: (context) => PayTicketsPage()),
                                        );*/
                                      },
                                      child: Text(
                                        "Politicas de privacidad",
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                        ),
                                        textAlign: TextAlign.end,
                                      )),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                onTap: () {
                                  /* print("prueba45");
                                    async() async {
                                      // BuildContext? context = null;
                                      Store<AppState> store = await createStore(api: endPointApi());

                                      store.dispatch(getUserIdAction(context: _context!, id: "2"));
                                      // store.dispatch(categoriesAction(_context, "2"));
                                    }

                                    async();*/
                                  async() async {
                                    // BuildContext? context = null;
                                    Store<AppState> store = await createStore(api: endPointApi());

                                    store.dispatch(updateProfileUserAction(
                                      context: context,
                                      id: ReduxLogin.store!.state.postsState.userLoginModel!.id.toString(),
                                      provider: "local",
                                      identificationTypeId: valueProfileId,
                                      identification: controllerPhoneIdentification.text,
                                      phoneNumber: controllerPhoneNumber.text,
                                      email: controllerEmailAddress.text,
                                      firstName: controllerName.text,
                                      lastname: controllerFullName.text,
                                      imageUrl: "-",
                                    ));
                                    // store.dispatch(categoriesAction(_context, "2"));
                                  }

                                  async();
                                  //  widget.registrationInteractor.register('phoneNumber', 'name', 'email');
                                  /* var api = endPointApi();
                        asinc() async {
                          Store<AppState> store = await createStore(api: api);

                          store.dispatch(UserSignUpAction(
                            context: context,
                            email: controllerEmailAddress.text,
                            password: controllerPassword.text,
                            name: controllerName.text,
                            lastname: controllerFullName.text,
                            identification: "",
                            identificationType: "",
                            phone: controllerPhoneNumber.text,
                            imageUrl: "",
                            state: "",
                          ));*/
                                },
                                label: "Actualizar",
                                color: AppColors.primaryColor,
                                textColor: Colors.white,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  @override
  void initState() {
    Timer.run(() {
      print("prueba45");
      async() async {
        // BuildContext? context = null;
        Store<AppState> store = await createStore(api: endPointApi());

        store.dispatch(getUserIdAction(context: _context!, id: ReduxLogin.store!.state.postsState.userLoginModel!.id.toString()));
        // store.dispatch(categoriesAction(_context, "2"));
      }

      async();
      UserLoginModel data = ReduxLogin.store!.state.postsState.userLoginModel!;
      controllerName.text = data.firstName.toString();
      controllerFullName.text = data.lastName.toString();
      controllerEmailAddress.text = data.email.toString();
      print("pruebaidenfitication: " + data.identification.toString());
      controllerPhoneNumber.text = data.identification.toString() == "null" ? "" : data.identification.toString();
      // valueProfile =  data.identification.toString();

      UserModelIdModel? dataGetUser = ReduxHome.store!.state.postsState!.userModelIdModel;
      valueProfileId = dataGetUser!.identificationTypeId.toString();
      valueProfile = dataGetUser!.identificationTypeName.toString();

      // you have a valid context here
    });
  }
}
