class ApiConstants{
 static const String  apiKey='bd4b650d4f8e49e7b259055a9b062c85';
 static const String  baseurl='https://api.spoonacular.com/recipes';
 String searchPathMaker(String query){
   return '$baseurl/complexSearch?query=$query&apiKey=$apiKey';
 }

}