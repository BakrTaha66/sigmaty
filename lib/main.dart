import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Sigmaty/config/my_router.dart';
import 'Sigmaty/presentation/manager/email_auth_cubit/email_auth_cubit.dart';
import 'Sigmaty/presentation/manager/reset_password/reset_password_cubit.dart';
import 'Sigmaty/presentation/manager/signout_cubit/signout_cubit.dart';
import 'Sigmaty/presentation/manager/signup_cubit/signup_cubit.dart';
import 'Sigmaty/presentation/manager/social_auth_cubit/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: Locale('ar'),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => EmailAuthCubit()),
        BlocProvider(create: (context) => SignOutCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => GoogleSignInCubit()),
        BlocProvider(create: (context) => SignupCubit()),
      ], child: MyApp()))
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routerConfig: MyRouter.router,
    );
  }
}
