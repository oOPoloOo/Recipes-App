class Recipe {
    
    final String name;
    final int cookTime;
    

    Recipe({     
      required this.name,
      required this.cookTime,     
    });
    
    Map<String,dynamic> toJson() => {      
      'name': name,
      'cookTime': cookTime,     
    };

    static Recipe fromJson(Map<String, dynamic> json) => Recipe(     
      name: json['name'],
      cookTime: json['cookTime'],      
    );
   }