// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/account/account_details/account_details_view.dart';
import '../ui/views/account/account_settings/account_settings_view.dart';
import '../ui/views/details/details_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/transaction/transaction_details/transaction_details_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String mainView = '/main-view';
  static const String accountSettingsView = '/account-settings-view';
  static const String accountDetailsView = '/account-details-view';
  static const String transactionDetailsView = '/transaction-details-view';
  static const String detailsView = '/details-view';
  static const all = <String>{
    startUpView,
    mainView,
    accountSettingsView,
    accountDetailsView,
    transactionDetailsView,
    detailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.accountSettingsView, page: AccountSettingsView),
    RouteDef(Routes.accountDetailsView, page: AccountDetailsView),
    RouteDef(Routes.transactionDetailsView, page: TransactionDetailsView),
    RouteDef(Routes.detailsView, page: DetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    MainView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const MainView(),
        settings: data,
      );
    },
    AccountSettingsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AccountSettingsView(),
        settings: data,
      );
    },
    AccountDetailsView: (data) {
      var args = data.getArgs<AccountDetailsViewArguments>(
        orElse: () => AccountDetailsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AccountDetailsView(
          key: args.key,
          isAddAccount: args.isAddAccount,
        ),
        settings: data,
      );
    },
    TransactionDetailsView: (data) {
      var args = data.getArgs<TransactionDetailsViewArguments>(
        orElse: () => TransactionDetailsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TransactionDetailsView(
          key: args.key,
          isAddTransaction: args.isAddTransaction,
        ),
        settings: data,
      );
    },
    DetailsView: (data) {
      var args = data.getArgs<DetailsViewArguments>(
        orElse: () => DetailsViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => DetailsView(
          key: args.key,
          name: args.name,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AccountDetailsView arguments holder class
class AccountDetailsViewArguments {
  final Key? key;
  final bool isAddAccount;
  AccountDetailsViewArguments({this.key, this.isAddAccount = true});
}

/// TransactionDetailsView arguments holder class
class TransactionDetailsViewArguments {
  final Key? key;
  final bool isAddTransaction;
  TransactionDetailsViewArguments({this.key, this.isAddTransaction = true});
}

/// DetailsView arguments holder class
class DetailsViewArguments {
  final Key? key;
  final String name;
  DetailsViewArguments({this.key, this.name = ''});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartUpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startUpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMainView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.mainView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAccountSettingsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountSettingsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAccountDetailsView({
    Key? key,
    bool isAddAccount = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountDetailsView,
      arguments:
          AccountDetailsViewArguments(key: key, isAddAccount: isAddAccount),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTransactionDetailsView({
    Key? key,
    bool isAddTransaction = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.transactionDetailsView,
      arguments: TransactionDetailsViewArguments(
          key: key, isAddTransaction: isAddTransaction),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDetailsView({
    Key? key,
    String name = '',
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.detailsView,
      arguments: DetailsViewArguments(key: key, name: name),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
