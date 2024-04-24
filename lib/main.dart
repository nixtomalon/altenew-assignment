import 'package:altenew_assignment/config/routes/routes.dart';
import 'package:altenew_assignment/features/products/presentations/bloc/bloc/product_bloc.dart';
import 'package:altenew_assignment/features/products/presentations/screens/product_list_screen.dart';
import 'package:altenew_assignment/injectable_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initializeDependencies();
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
      'https://testaltenew.myshopify.com/admin/api/2024-04/graphql.json',
      defaultHeaders: {
        'X-Shopify-Access-Token': 'access_token',
      });

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
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
