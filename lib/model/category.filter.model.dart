import 'category.model.dart';
import 'recipe.model.dart';

class CategoryFilter{
      
      List<Recipe> recipes;
      String category;

      CategoryFilter(this.recipes,this.category);
       
        List<Recipe> get getRecipes { return recipes; }
        //List<Category> get getCategories { return categories; }

}

   