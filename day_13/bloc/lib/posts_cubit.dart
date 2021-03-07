import 'package:bloc/data_service.dart';
import 'package:bloc/post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = Dataservice();

  PostsCubit() : super([]);

  void getPosts() => emit([await _dataService.getPosts()]);
}
