import 'package:flavorfusion/modules/home_layout.dart';
import 'package:flavorfusion/shared/cubit/category_cubit/category_cubit.dart';
import 'package:flavorfusion/shared/networks/local/cache_helper.dart';
import 'package:flavorfusion/shared/networks/remote/dio_helper.dart';
import 'package:flavorfusion/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return CategoryCubit()..getCategories();
        }),
      ],
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
