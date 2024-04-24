import 'package:altenew_assignment/config/routes/routes.dart';
import 'package:altenew_assignment/features/products/presentations/bloc/product_bloc.dart';
import 'package:altenew_assignment/features/products/presentations/screens/product_list_screen.dart';
import 'package:altenew_assignment/injectable_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductBloc(sl())..add(GetProductsEvent())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoutes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductListScreen(),
        ));
  }
}
