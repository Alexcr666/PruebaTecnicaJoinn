import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
  };

  String? get enterPhoneNumber {
    return _localizedValues[locale.languageCode]!['enterPhoneNumber'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get orContinueWith {
    return _localizedValues[locale.languageCode]!['orContinueWith'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'];
  }

  String? get createAccount {
    return _localizedValues[locale.languageCode]!['createAccount'];
  }

  String? get itWillTakeLessThanAMinute {
    return _localizedValues[locale.languageCode]!['itWillTakeLessThanAMinute'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get wellSendVerificationOnGiven {
    return _localizedValues[locale.languageCode]!['wellSendVerificationOnGiven'];
  }

  String? get bySigningUpYouAgreeToOur {
    return _localizedValues[locale.languageCode]!['bySigningUpYouAgreeToOur'];
  }

  String? get termsNConditions {
    return _localizedValues[locale.languageCode]!['termsNConditions'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get enter6DigitVerification {
    return _localizedValues[locale.languageCode]!['enter6DigitVerification'];
  }

  String? get enterVerificationCode {
    return _localizedValues[locale.languageCode]!['enterVerificationCode'];
  }

  String? get payPal {
    return _localizedValues[locale.languageCode]!['payPal'];
  }

  String? get payUMoney {
    return _localizedValues[locale.languageCode]!['payUMoney'];
  }

  String? get bankTransfer {
    return _localizedValues[locale.languageCode]!['bankTransfer'];
  }

  String? get chequePayment {
    return _localizedValues[locale.languageCode]!['chequePayment'];
  }

  String? get netBanking {
    return _localizedValues[locale.languageCode]!['netBanking'];
  }

  String? get payOnSpot {
    return _localizedValues[locale.languageCode]!['payOnSpot'];
  }

  String? get selectOptionToPay {
    return _localizedValues[locale.languageCode]!['selectOptionToPay'];
  }

  String? get pay {
    return _localizedValues[locale.languageCode]!['pay'];
  }

  String? get ticketBooked {
    return _localizedValues[locale.languageCode]!['ticketBooked'];
  }

  String? get myBookings {
    return _localizedValues[locale.languageCode]!['myBookings'];
  }

  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get bassHill {
    return _localizedValues[locale.languageCode]!['bassHill'];
  }

  String? get date {
    return _localizedValues[locale.languageCode]!['date'];
  }

  String? get time {
    return _localizedValues[locale.languageCode]!['time'];
  }

  String? get ticketType {
    return _localizedValues[locale.languageCode]!['ticketType'];
  }

  String? get visitorName {
    return _localizedValues[locale.languageCode]!['visitorName'];
  }

  String? get showTheQRCode {
    return _localizedValues[locale.languageCode]!['showTheQRCode'];
  }

  String? get bookYourTickets {
    return _localizedValues[locale.languageCode]!['bookYourTickets'];
  }

  String? get ticketDetails {
    return _localizedValues[locale.languageCode]!['ticketDetails'];
  }

  String? get randomDateTime {
    return _localizedValues[locale.languageCode]!['randomDateTime'];
  }

  String? get platinumTicket {
    return _localizedValues[locale.languageCode]!['platinumTicket'];
  }

  String? get tickets {
    return _localizedValues[locale.languageCode]!['tickets'];
  }

  String? get each {
    return _localizedValues[locale.languageCode]!['each'];
  }

  String? get convenienceCharges {
    return _localizedValues[locale.languageCode]!['convenienceCharges'];
  }

  String? get proceedToPay {
    return _localizedValues[locale.languageCode]!['proceedToPay'];
  }

  String? get americanMusicProducer {
    return _localizedValues[locale.languageCode]!['americanMusicProducer'];
  }

  String? get followers {
    return _localizedValues[locale.languageCode]!['followers'];
  }

  String? get followNow {
    return _localizedValues[locale.languageCode]!['followNow'];
  }

  String? get about {
    return _localizedValues[locale.languageCode]!['about'];
  }

  String? get listenOn {
    return _localizedValues[locale.languageCode]!['listenOn'];
  }

  String? get upcomingEvents {
    return _localizedValues[locale.languageCode]!['upcomingEvents'];
  }

  String? get away {
    return _localizedValues[locale.languageCode]!['away'];
  }

  String? get eventOn {
    return _localizedValues[locale.languageCode]!['eventOn'];
  }

  String? get djLineUp {
    return _localizedValues[locale.languageCode]!['djLineUp'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get peopleAreAttending {
    return _localizedValues[locale.languageCode]!['peopleAreAttending'];
  }

  String? get bookYourTicketNow {
    return _localizedValues[locale.languageCode]!['bookYourTicketNow'];
  }

  String? get forYou {
    return _localizedValues[locale.languageCode]!['forYou'];
  }

  String? get allEvents {
    return _localizedValues[locale.languageCode]!['allEvents'];
  }

  String? get selectSeats {
    return _localizedValues[locale.languageCode]!['selectSeats'];
  }

  String? get allEyesThisWay {
    return _localizedValues[locale.languageCode]!['allEyesThisWay'];
  }

  String? get premium {
    return _localizedValues[locale.languageCode]!['premium'];
  }

  String? get standard {
    return _localizedValues[locale.languageCode]!['standard'];
  }

  String? get normal {
    return _localizedValues[locale.languageCode]!['normal'];
  }

  String? get faq1 {
    return _localizedValues[locale.languageCode]!['faq1'];
  }

  String? get faq2 {
    return _localizedValues[locale.languageCode]!['faq2'];
  }

  String? get faq3 {
    return _localizedValues[locale.languageCode]!['faq3'];
  }

  String? get faq4 {
    return _localizedValues[locale.languageCode]!['faq4'];
  }

  String? get faq5 {
    return _localizedValues[locale.languageCode]!['faq5'];
  }

  String? get faq6 {
    return _localizedValues[locale.languageCode]!['faq6'];
  }

  String? get faq7 {
    return _localizedValues[locale.languageCode]!['faq7'];
  }

  String? get faqs {
    return _localizedValues[locale.languageCode]!['faqs'];
  }

  String? get myDjs {
    return _localizedValues[locale.languageCode]!['myDjs'];
  }

  String? get followings {
    return _localizedValues[locale.languageCode]!['followings'];
  }

  String? get myTickets {
    return _localizedValues[locale.languageCode]!['myTickets'];
  }

  String? get fireDance {
    return _localizedValues[locale.languageCode]!['fireDance'];
  }

  String? get apoloDance {
    return _localizedValues[locale.languageCode]!['apoloDance'];
  }

  String? get getDirection {
    return _localizedValues[locale.languageCode]!['getDirection'];
  }

  String? get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'];
  }

  String? get events {
    return _localizedValues[locale.languageCode]!['events'];
  }

  String? get listOfAllEvents {
    return _localizedValues[locale.languageCode]!['listOfAllEvents'];
  }

  String? get djsYouFollow {
    return _localizedValues[locale.languageCode]!['djsYouFollow'];
  }

  String? get listOfEventBooked {
    return _localizedValues[locale.languageCode]!['listOfEventBooked'];
  }

  String? get knowAboutCompanypolicies {
    return _localizedValues[locale.languageCode]!['knowAboutCompanypolicies'];
  }

  String? get getYourQuestionsAnswered {
    return _localizedValues[locale.languageCode]!['getYourQuestionsAnswered'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get signOutFromYourAccount {
    return _localizedValues[locale.languageCode]!['signOutFromYourAccount'];
  }

  String? get hey {
    return _localizedValues[locale.languageCode]!['hey'];
  }

  String? get tnC {
    return _localizedValues[locale.languageCode]!['tnC'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'id', 'pt', 'fr', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
