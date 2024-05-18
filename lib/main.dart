import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mandiri_mobile/viewmodels/recipes_viewmodel.dart';
import 'package:tugas_mandiri_mobile/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeViewModel()..fetchRecipes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Recipe A'pp",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RecipeListScreen(),
      ),
    );
  }
}
