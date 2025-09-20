import 'package:shared_preferences/shared_preferences.dart';

Future <void> saveMostRecentData(int mostRecentIndex)async{
  
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>mostRecentList =prefs.getStringList("most_recent")??[];
  if(mostRecentList.contains("$mostRecentIndex")){
    mostRecentList.remove("$mostRecentIndex");
mostRecentList.add("$mostRecentIndex");
  }
  else{
    mostRecentList.add( "$mostRecentIndex");
    
  }
  
  
  if(mostRecentList.length >5){
    mostRecentList.removeAt(0);
  }

   
  await prefs.setStringList("most_recent", mostRecentList);


}
Future<List<int>> getMostRecentData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
 List<String>mostRecentData= prefs.getStringList("most_recent")??[];
 List<int>mostRecentDataAsInt =  mostRecentData.map((element)=>int.parse(element)).toList();
 
return mostRecentDataAsInt.reversed.toList();

}