
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:recipes_app/services/services.dart';
import 'package:recipes_app/model/models.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


class RecipesRepository {
StorageServices storage = StorageServices();
DatabaseServices db = DatabaseServices(); 

    Future<String> downloadImgURL(String imgName) {
      return storage.downloadImgURL(imgName);
    }

    Future<List<Recipe>> readRecipes() {
      return db.readRecipesQuery();
    }

    Future<void> writeRecipe(Recipe recipe) {
      return db.uploadRecipeData(recipe);
    }

  
  Future pickRecipeImg(ImageSource source) async {
    
    //With ImagePicker
    final ImagePicker _picker = ImagePicker();

    //Picking image from gallery or takng photo and drom quality 50%
    final pickedFile = await  _picker.pickImage(source: source, imageQuality: 50);
   
    if(pickedFile == null) return;

    //Crop image to selectect aspec ratio
    var file = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 4), //6/8 
    );
    if(file == null) return;
   
    //Compressing the image
    File finalFile = await compressImage(file.path, 35);
   
   return finalFile;
    //await _uploadFile(finalFile.path);
  }
 
  //Optional, already compressed one time when picked file
  Future<File> compressImage(String path, int quality) async {
    
    //Path to to temporary save compressed image to device
    //Arguments: path, file name
    final newPath = p.join((await getTemporaryDirectory()).path, '${DateTime.now()}.${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(
      path, 
      newPath,
      quality: quality
    );

    return result!;
  }

  Future<String> uploadFile(String path) async {
     return storage.UploadFile2(path);
  }
}