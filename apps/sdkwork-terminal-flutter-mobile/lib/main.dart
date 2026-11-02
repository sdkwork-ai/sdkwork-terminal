import 'package:flutter/material.dart';

import 'app.dart';
import 'bootstrap/iam_runtime.dart';
import 'bootstrap/sdkwork_tls_trust.dart';
import 'bootstrap/session.dart';

Future<void> main() async {
  // The HTTPS trust layer must be installed before any HTTP client is
  // created, so it runs ahead of binding initialization and services.
  SdkworkTlsTrust.installForApp();

  WidgetsFlutterBinding.ensureInitialized();
  final session = await TerminalSessionStore.load();
  initializeIamRuntime(session);
  runApp(const TerminalApp());
}
