class ApiConstants{
 static const String  apiKey='get your api key and placed here';
 //
 static const String  baseurl='https://api.spoonacular.com/recipes';
 String searchPathMaker(String query){
   return '$baseurl/complexSearch?query=$query&apiKey=$apiKey';
 }
 String getRecipeDetailsPath(int id){
   return '$baseurl/$id/information?apiKey=$apiKey&includeNutrition=true';
 }
 String getRandomRecipePath(){
   return '$baseurl/random?apiKey=$apiKey&includeNutrition=true';
 }

}