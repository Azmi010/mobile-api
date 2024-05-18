import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mandiri_mobile/viewmodels/recipes_viewmodel.dart';

class RecipeDetailScreen extends StatelessWidget {
  final int recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final recipe = recipeViewModel.getRecipeById(recipeId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Detail'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.image),
            const SizedBox(height: 16.0),
            Text(
              recipe.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Prep Time: ${recipe.prepTimeMinutes} minutes',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Cook Time: ${recipe.cookTimeMinutes} minutes',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Servings: ${recipe.servings}',
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Difficulty: ${recipe.difficulty}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.ingredients
                  .map((ingredient) => Text(ingredient))
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe.instructions
                  .map((instruction) => Text(instruction))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
