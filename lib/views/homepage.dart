// recipe_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_mandiri_mobile/viewmodels/recipes_viewmodel.dart';
import 'package:tugas_mandiri_mobile/views/detail.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          if (recipeViewModel.isLoading) const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: recipeViewModel.recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipeViewModel.recipes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipeId: recipe.id),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 200,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                recipe.image,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                recipe.name,
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
