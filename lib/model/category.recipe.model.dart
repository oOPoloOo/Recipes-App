import 'category.model.dart';
import 'recipe.model.dart';

class CategoryRecipe{
      
      List<Recipe> recipes;
      List<Category> categories;
      CategoryRecipe(this.recipes,this.categories);
       
        List<Recipe> get getRecipes { return recipes; }
        List<Category> get getCategories { return categories; }

    }

   