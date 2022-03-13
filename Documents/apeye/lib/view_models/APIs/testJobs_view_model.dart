import 'package:apeye/API/model/Jobs.dart';
import 'package:apeye/services/testJob_services.dart';
import 'package:flutter/cupertino.dart';

class testJobs_view_model extends ChangeNotifier {
  List<Jobs> _jobsList = [];
  // List<String> interests_p = ['Engineer, Computer'];

  Future<void> fetchJobs(List interests) async {
    
    _jobsList = await testJob_services().fetchJobs(interests);
    print("89283208098094");print(_jobsList.toString());

    notifyListeners();
  }

  List<Jobs> get jobsList => _jobsList;
}