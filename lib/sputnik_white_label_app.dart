//  Copyright (C) 2019 Mohammed El Batya
//
//  This file is part of sputnik_white_label_app.
//
//  sputnik_white_label_app is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sputnik_app_state/sputnik_app_state.dart';
import 'package:sputnik_matrix_sdk/matrix_manager/account_controller.dart';
import 'package:sputnik_matrix_sdk/matrix_manager/matrix_manager.dart';
import 'package:sputnik_matrix_sdk/matrix_manager/sync_handle.dart';
import 'package:sputnik_ui/config/global_config_data.dart';
import 'package:sputnik_ui/config/global_config_widget.dart';
import 'package:sputnik_ui/tool/file_saver.dart';
import 'package:sputnik_ui/widget/route/conversations_list_route.dart';
import 'package:sputnik_ui/widget/route/login_route.dart';

import 'defaults/default_white_label_config.dart';

class SputnikWhiteLabelApp extends StatefulWidget {
  final GlobalConfigData globalConfigData;

  factory SputnikWhiteLabelApp({Key key, GlobalConfigData globalConfig}) {
    return SputnikWhiteLabelApp._(
      key: key,
      globalConfigData: globalConfig ?? DefaultConfig(),
    );
  }

  SputnikWhiteLabelApp._({
    Key key,
    this.globalConfigData,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SputnikWhiteLabelAppState();
  }
}

class SputnikWhiteLabelAppState extends State<SputnikWhiteLabelApp> with WidgetsBindingObserver {
  Future<MatrixManager> initFuture;
  SyncHandle syncHandle;
  AccountController accountController;

  Future<MatrixManager> _initMatrixManager() async {
    final sw = Stopwatch()..start();
    final matrixManager = await MatrixManager.create(widget.globalConfigData.userAgent);
    if (matrixManager.matrixStore.state.accountSummaries.length > 0) {
      final firstAccount = matrixManager.matrixStore.state.accountSummaries.values.first;
      await matrixManager.loadAccountState(firstAccount.userId);

      accountController = matrixManager.getAccountController(firstAccount.userId);
      _startSync();
    }
    debugPrint('init matrix manager in ${sw.elapsedMilliseconds}ms');
    return matrixManager;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    this.initFuture = _initMatrixManager();
  }

  @override
  void dispose() {
    _stopSync();
    WidgetsBinding.instance.removeObserver(this);
    initFuture.then((matrixManager) => matrixManager.dispose());
    super.dispose();
  }

  _startSync() async {
    if (accountController != null) {
      debugPrint('start sync');
      syncHandle = accountController.startContinuousSync();
    }
  }

  _stopSync() {
    if (syncHandle != null) {
      debugPrint('stop sync');
      syncHandle.stop();
      syncHandle = null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return GlobalConfig(
      config: widget.globalConfigData,
      child: MaterialApp(
        title: widget.globalConfigData.title,
        theme: widget.globalConfigData.sputnikThemeData.materialThemeData,
        home: FutureBuilder<MatrixManager>(
          future: initFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final matrixManager = snapshot.data;
              if (matrixManager.matrixStore.state.accountSummaries.length > 0) {
                final firstAccount = matrixManager.matrixStore.state.accountSummaries.values.first;
                final accountController = matrixManager.getAccountController(firstAccount.userId);
                return StoreProvider<SputnikAppState>(
                  store: matrixManager.matrixStore,
                  child: ConversationListRoute(accountController),
                );
              } else {
                return LoginRoute(
                  matrixManager: matrixManager,
                  artwork: widget.globalConfigData.loginScreenArtwork,
                  background: widget.globalConfigData.loginScreenBackground,
                  defaultDeviceName: widget.globalConfigData.defaultDeviceName,
                );
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        _stopSync();
        break;
      case AppLifecycleState.suspending:
        break;
      case AppLifecycleState.resumed:
        _startSync();
        break;
    }
  }
}
