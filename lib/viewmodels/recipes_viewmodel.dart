import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tugas_mandiri_mobile/models/recipes.dart';

class RecipeViewModel extends ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _isLoading = false;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

    if (response.statusCode == 200) {
      final List<dynamic> recipeJson = json.decode(response.body)['recipes'];
      _recipes = recipeJson.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw e;
    }

    _isLoading = false;
    notifyListeners();
  }

  Recipe getRecipeById(int id) {
    final recipe = _recipes.firstWhere((recipe) => recipe.id == id, orElse: () {
      throw Exception("Recipe with id $id not found");
    });
    return recipe;
  }
}
