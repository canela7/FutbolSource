//
//  DataSet.swift
//
//
//  Created by Brian Canela on 5/30/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation

class DataSet {
    
//    let categories = [
//        Teams(title: "Premier League", imageName: "burger0"),
//        Teams(title: "Premier League", imageName: "burger0"),
//        Teams(title: "Premier League", imageName: "burger0")
//    ]
//
    
    let leagueCategories = [
        Leagues(leagueID: 1, leagueTitle: "Premier League", leagueLogo: "burger0"),
        Leagues(leagueID: 2, leagueTitle: "Liga MX", leagueLogo: "burger0"),
        Leagues(leagueID: 3, leagueTitle: "La Liga", leagueLogo: "burger0")
    ]

//    let burgers = [
//        Recipe(title: "Bacon Cheeseburger", instructions: "1 1/2 pounds ground beef chuck. \n4 1/2-inch cubes pepper jack cheese (about 1 ounce total) \nKosher salt and freshly ground pepper.\n1/2 tablespoon vegetable oil. \n4 slices cheddar cheese (about 2 ounces) \n4 hamburger buns. \nKetchup, mustard and/or mayonnaise, for spreading (optional)", imageName: "burger0")
//    ]
//
//    let pasta = [
//        Recipe(title: "Spaghetti", instructions: "Melt butter in medium saucepan with olive oil over medium/low heat. \nAdd the garlic, cream, white pepper and bring mixture to a simmer. \nStir often. \nAdd the Parmesan cheese and simmer sauce for 8-10 minutes or until sauce has thickened and is smooth.", imageName: "pasta0")
//    ]
//
//    let pizza = [
//        Recipe(title: "Neapolitan Pizza", instructions: "1 1/2 cups (355 ml) warm water (105°F-115°F) \n1 package (2 1/4 teaspoons) of active dry yeast \n3 3/4 cups (490 g) bread flour \n2 Tbsp olive oil (omit if cooking pizza in a wood-fired pizza oven) \n2 teaspoons salt \n1 teaspoon sugar", imageName: "pizza0")    ]
//
//    let salads = [
//        Recipe(title: "Cobb Salad", instructions: "In a jar with tight-fitting lid, combine the oil, lemon juice, garlic, salt and pepper; cover and shake well. Chill. \nIn a large serving bowl, toss the romaine, tomatoes, Swiss cheese, almonds if desired, Parmesan cheese and bacon. \nShake dressing; pour over salad and toss. Add croutons and serve immediately.", imageName: "salad0")
//   ]
//
//    let sandwiches = [
//        Recipe(title: "Deli Sub", instructions: "Toast the bread in a toaster, or under a broiler on both sides. Cut the lettuce leaves in half crosswise and form into 8 neat stacks. \nTo make a double-decker club: On a clean work surface, arrange 3 bread slices in a row. Spread 1 tablespoon mayonnaise over 1 side of each bread slice. Place a lettuce stack on top of the first bread slice, top with 2 tomato slices, and season with salt and pepper, to taste.", imageName: "sandwich0")
//    ]
//
//    func getRecipes(forCategoryTitle title:String) -> [Recipe] {
//        switch title {
//        case "Burgers":
//            return burgers
//        case "Pasta":
//            return pasta
//        case "Pizza":
//            return pizza
//        case "Salads":
//            return salads
//        case "Sandwiches":
//            return sandwiches
//        default:
//            return burgers
//        }
//    }
}

