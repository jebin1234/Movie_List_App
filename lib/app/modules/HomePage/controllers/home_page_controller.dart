import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePageController extends GetxController {
  //TODO: Implement HomePageController

List tendingmovie =[].obs;
List nowplaying =[].obs;
List upcoming =[].obs;

var isLoading = false.obs;



final String apikey ='459f31e6fd66e10ddb99e390b527c73f';
final readaccesskey ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTlmMzFlNmZkNjZlMTBkZGI5OWUzOTBiNTI3YzczZiIsInN1YiI6IjY0MzYzYWYxOTQ1ZDM2MDA3N2JmODRhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NZoSTgGW-rZHVEJNd1MSTiaPEKxfENNsSopnL0Ovc7c';

  @override
  void onInit() {
    loadmovies();
    super.onInit();
  }



  loadmovies() async{
    isLoading(true);
 TMDB tmdbWithCustomLogs =TMDB(ApiKeys(apikey, readaccesskey),
   logConfig: ConfigLogger(
     showLogs: true,
     showErrorLogs: true
   )
 );
 Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
 tendingmovie =trendingresult['results'];
 print(tendingmovie);

 Map nowplayingresult =await tmdbWithCustomLogs.v3.movies.getNowPlaying();
 nowplaying = nowplayingresult['results'];
 print(nowplaying);

 Map upcomingresult =await tmdbWithCustomLogs.v3.movies.getUpcoming();
 upcoming = upcomingresult['results'];
 print(upcoming);

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
