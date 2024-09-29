import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/app_theme.dart';
import 'core/constant/approuter.dart';
import 'core/storage/storage_handler.dart';
import 'feature/auth/login/presentation/bloc/login_bloc.dart';
import 'feature/auth/signup/presentation/bloc/signup_cubit.dart';
import 'feature/home/presentation/bloc/home_cubit.dart';
import 'feature/product/presentation/bloc/products_cubit.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await StorageHandler().init();
  runApp(EasyLocalization(supportedLocales: const [
    Locale('ar'),
    Locale('en'),
  ], path: 'assets/translations', child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<HomeCubit>()),
        BlocProvider(create: (context) => di.sl<ProductsCubit>()),
        BlocProvider(create: (context) => di.sl<LoginCubit>()),
        BlocProvider(create: (context) => di.sl<SignupCubit>()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Moovo',
            theme: appTheme,
            routerConfig: AppRouter.router,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
          );
        },
      ),
    );
  }
}
