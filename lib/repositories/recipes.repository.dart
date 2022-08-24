import 'package:recipes_app/services/services.dart';
import 'package:recipes_app/model/models.dart';

class RecipesRepository {
StorageServices storage = StorageServices();
DatabaseServices db = DatabaseServices(); 

    Future<String> downloadImgURL(String imgName) {
      return storage.downloadImgURL(imgName);
    }

    Future<List<Recipe>> readRecipes() {
      return db.readRecipesQuery();
    }

    Future<void> writeRecipes(Recipe recipe) {
      return db.uploadRecipeData(recipe);
    }
}