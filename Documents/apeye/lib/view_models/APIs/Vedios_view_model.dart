import 'package:apeye/API/model/Videos.dart';
import 'package:apeye/services/Video_services.dart';
import 'package:flutter/cupertino.dart';

class Vedios_view_model extends ChangeNotifier {
  List<Vedios> _vediosList = [];
  
  Future<void> fetchVedios(List interests) async {
    for(String interest in interests)
    _vediosList = await Video_services().fetchVedios(
      query: {
        "q": '${interest}'
      },
    );

    print(_vediosList);
    notifyListeners();
  }

  List<Vedios> get vediosList => _vediosList;
}
