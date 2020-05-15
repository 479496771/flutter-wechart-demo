import '../config/service.dart';

getTestData () async{
  try {
    final response = await Api.get("/test");
    if(response["status"] == 4001) {
      return response["data"];
    } else {
      return {};
    }
  } catch (e) {
    return print('ERROR =======> $e');
  }
}
