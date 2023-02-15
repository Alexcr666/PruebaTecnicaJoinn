import 'dart:collection';

import 'package:dj_mania/Drawer/Events/eventList.dart';
import 'package:dj_mania/Drawer/Events/events.dart';
import 'package:dj_mania/Drawer/Events/shopers/shoperPage.dart';
import 'package:dj_mania/app/app_colors.dart';
import 'package:dj_mania/redux/settingApp/store.dart';
import 'package:dj_mania/utils/utils.dart';
import 'package:dj_mania/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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

List<DateTime> listdate = [];
var kEvents2 = LinkedHashMap<DateTime, List<Event2>>();

/*List<Event2>*/ getEventsForDaySet() {
  print("ejecuto");

  /* final kEvents2 = Map.fromIterable(List.generate(50, (index) => index),
      key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
      value: (item) => List.generate(item % 4 + 1, (index) => Event2('Event $item | ${index + 1}')))
    ..addAll({
      kToday: [
        Event2('Today\'s Event 1'),
        Event2('Today\'s Event 2'),
      ],
    });*/

  // final kEvents2 = LinkedHashMap<DateTime, List<Event2>>();

  // EventListHomeModel dataResult = ReduxHome.store!.state.postsState.listevent![i];
  //final kToday2 = DateTime.now();
  // final kFirstDay2 = DateTime(kToday2.year, kToday2.month, kToday2.day);
  //final kLastDay2 = DateTime(kToday2.year, kToday2.month + 1, kToday2.day);
  kEvents2 = LinkedHashMap<DateTime, List<Event2>>();
  int totalExecute = 0;
  for (var i = 0; i < ReduxHome.store!.state.postsState.listevent!.length; i++) {
    EventListHomeModel data = ReduxHome.store!.state.postsState.listevent![i];
    endPointApi().getEventDetailsEndpoint(data.id.toString()).then((value) {
      EventDetailsModel dataEvent = eventDetailsModelFromJson(value.data);
      totalExecute += 1;
      listdate.add(dataEvent.dateTimeEvent!);

      print("ejecuto" + totalExecute.toString() + ": " + ReduxHome.store!.state.postsState.listevent!.length.toString());
      if (totalExecute == (ReduxHome.store!.state.postsState.listevent!.length)) {
        final _kEventSource2 = Map.fromIterable(List.generate(listdate.length, (index) => index),
            key: (item) => DateTime.utc(listdate[item].year, listdate[item].month, listdate[item].day),
            value: (item) {
              /*  int valueEvent = 0;
              for (var i = 0; i < listdate.length; i++) {
                if (listdate[i] == listdate[item]) {
                  valueEvent += 1;
                }
              }
              print("pruebaitem: " + valueEvent.toString());*/
              return List.generate(1,
                  (index) => Event2(/*ReduxHome.store!.state.postsState.listevent![item].name.toString()*/ 'Event $item | ${index + 1}'));
            })
          ..addAll({
            kToday: [
              // Event2('Today\'s Event 1'),
              // Event2('Today\'s Event 2'),
            ],
          });

        kEvents2.addAll(_kEventSource2);
      }
    });
  }

  //  }

  // Implementation example
  // return kEvents2[day] ?? [];
}

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event2>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    async() async {
      // BuildContext? context = null;
      DateTime dateActual = new DateTime.now();

      Store<AppState> store = await createStore(api: endPointApi());
      String date = dateActual.toString();
      String date2 = dateActual.add(const Duration(days: 1)).toString();
      store.dispatch(getEventsCalendarAction(context, startDate: date, endDate: date2, placeId: ""));

      // store.dispatch(categoriesAction(_context, "2"));
    }

    async();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event2> _getEventsForDay(DateTime day) {
    print("prueba100: " + day.toString());

    /*final kEvents0 = Map.fromIterable(List.generate(50, (index) => index),
        key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
        value: (item) => List.generate(item % 4 + 1, (index) => Event2('Event $item | ${index + 1}')))
      ..addAll({
        kToday: [
          Event2('Today\'s Event 1'),
          Event2('Today\'s Event 2'),
        ],
      });*/
    return kEvents2[day] ?? [];
  }

  List<Event2> _getEventsForDayGet(DateTime day) {
    print("prueba100: " + day.toString());

    final kEvents0 = Map.fromIterable(List.generate(50, (index) => index),
        key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
        value: (item) => List.generate(item % 4 + 1, (index) => Event2('Event $item | ${index + 1}')))
      ..addAll({
        kToday: [
          Event2('Today\'s Event 1'),
          Event2('Today\'s Event 2'),
        ],
      });
    return kEvents0[day] ?? [];
  }

  List<Event2> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      print("selected");

      async() async {
        // BuildContext? context = null;
        Store<AppState> store = await createStore(api: endPointApi());
        String date = selectedDay.toString();
        String date2 = selectedDay.add(const Duration(days: 1)).toString();
        store.dispatch(getEventsCalendarAction(context, startDate: date, endDate: date2, placeId: ""));

        // store.dispatch(categoriesAction(_context, "2"));
      }

      async();

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
    print("selected2");

    async() async {
      // BuildContext? context = null;
      print("prueba70: " + _rangeStart.toString() + " : " + _rangeEnd.toString());
      Store<AppState> store = await createStore(api: endPointApi());
      String date = _rangeStart.toString() /*.subtract(const Duration(days: 1))*/;
      String date2 = _rangeEnd.toString();
      store.dispatch(getEventsCalendarAction(context, startDate: date, endDate: date2, placeId: ""));

      // store.dispatch(categoriesAction(_context, "2"));
    }

    async();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppStateHome>(
        store: ReduxHome.store!,
        child: StoreConnector<AppStateHome, dynamic>(
            converter: (store) => store.state.postsState,
            builder: (context, value) {
              return Scaffold(
                appBar: AppWidgetSize().appBar(title: "Calendar"),
                backgroundColor: AppColors().backgroundColor,
                // backgroundColor: Colors.black,
                body: Column(
                  children: [
                    TableCalendar<Event2>(
                      firstDay: kFirstDay,
                      lastDay: kLastDay,
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                      rangeStartDay: _rangeStart,
                      rangeEndDay: _rangeEnd,
                      calendarFormat: _calendarFormat,
                      rangeSelectionMode: _rangeSelectionMode,
                      eventLoader: _getEventsForDay,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      onDaySelected: _onDaySelected,
                      onRangeSelected: _onRangeSelected,
                      onFormatChanged: (format) {
                        //   print("prueba60---1");
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        print("prueba60---2");

                        _focusedDay = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,

                        rangeHighlightColor: AppColors.primaryColor.withOpacity(0.5),
                        todayTextStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                        defaultTextStyle: TextStyle().copyWith(color: AppColors().textColorGeneral),
                        rangeEndTextStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                        holidayTextStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                        withinRangeTextStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                        // weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
                        // holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekendStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                        weekdayStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                      ),
                      headerStyle: HeaderStyle(
                        //  centerHeaderTitle: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle().copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                        formatButtonTextStyle: TextStyle().copyWith(color: AppColors.primaryColor),
                        leftChevronIcon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors().textColorGeneral,
                        ),
                        rightChevronIcon: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors().textColorGeneral,
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        singleMarkerBuilder: (context, date, _) {
                          return Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryColor), //Change color
                            width: 5.0,
                            height: 5.0,
                            // width: 0,
                            //height: 0,
                            margin: const EdgeInsets.symmetric(horizontal: 1.5),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ReduxHome.store!.state.postsState.listEventsCalendar == null
                        ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
                        : ReduxHome.store!.state.postsState.listEventsCalendar!.length == 0
                            ? Text("No hay resultados", style: TextStyle(fontSize: 15.0, color: Colors.white))
                            : Expanded(
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: ReduxHome.store!.state.postsState.listEventsCalendar!.length,
                                    itemBuilder: (context, index) {
                                      Widget data =
                                          itemEvent(context, ReduxHome.store!.state.postsState.listEventsCalendar![index], calendar: true);

                                      /*   searchCategorie() {
                          if (stateSelectCategorie == "All") {
                            data = itemEvent(context, events[index]);
                          } else {
                            if (stateSelectCategorie == events[index].categorie) {
                              data = itemEvent(context, events[index]);
                            } else {
                              data = SizedBox();
                            }
                          }
                        }

                        if (searchEvent.trim().length == 0) {
                          if (stateSelectCategorie == "") {
                            data = itemEvent(context, events[index]);
                          } else {
                            searchCategorie();
                          }
                        } else {
                          print("prueba34: " + (searchEvent.toLowerCase().similarityTo(events[index].title.toLowerCase()).toString()));
                          if (searchEvent.toLowerCase().similarityTo(events[index].title.toLowerCase()) >= 0.2) {
                            if (stateSelectCategorie == "") {
                              data = itemEvent(context, events[index]);
                            } else {
                              searchCategorie();
                            }
                          } else {
                            data = SizedBox();
                          }
                        }*/
                                      return data;
                                      // return SizedBox();
                                    }),
                              ),
                    /* Expanded(
            child: ValueListenableBuilder<List<Event2>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    //return itemListView(context, events[index]);
                    return SizedBox();

                    /*return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text(
                          '${value[index]}',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    );*/
                  },
                );
              },
            ),
          ),*/
                  ],
                ),
              );
            }));
  }
}
