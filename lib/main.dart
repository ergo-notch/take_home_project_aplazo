import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_project/features/search_recipes/presentation/bloc/seach_recipes_bloc.dart';

import 'core/di/injection_modules.dart' as di;
import 'core/router/router.dart';
import 'core/utils/simple_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = const SimpleBlocObserver();
  await di.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<SearchRecipesBloc>(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
