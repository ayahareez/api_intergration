import 'package:api_integarion/emoji/presentation/pages/emoji_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'al_quran/presentation/bloc/al_quran_bloc.dart';
import 'dog_image/presentation/bloc/dog_bloc.dart';
import 'emoji/presentation/bloc/emoji_bloc.dart';
import 'fruit/presentation/bloc/fruit_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AlQuranBloc>(
          create: (context) => AlQuranBloc(),
        ),
        BlocProvider<DogBloc>(
          create: (context) => DogBloc(),
        ),
        BlocProvider<EmojiBloc>(
          create: (context) => EmojiBloc(),
        ),
        BlocProvider<FruitBloc>(
          create: (context) => FruitBloc(),
        ),
        // Add more BLoCs as needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EmojiScreen(),
    );
  }
}