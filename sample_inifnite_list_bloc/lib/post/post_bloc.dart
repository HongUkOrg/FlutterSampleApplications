
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sampleinifnitelistbloc/model/post.dart';
import 'package:sampleinifnitelistbloc/post/post_event.dart';
import 'package:sampleinifnitelistbloc/post/post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {

  final Client httpclient;

  PostBloc(this.httpclient);

  @override
  PostState get initialState => Initial();

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(Stream<PostEvent> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(const Duration(milliseconds: 500)),
        transitionFn
    );
  }

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {

    print('current event $event');
    final currentState = state;
//    if (event is FetchPost == false || _hasReachedMax(currentState) == false) {
//      print('Invalid event');
//      return;
//    }
    print('$currentState');
    try {
      if (currentState is Initial) {

        final posts = await _fetchPosts(0, 20);
        yield Success(posts, false);
      } else if (currentState is Success) {

        final posts = await _fetchPosts(currentState.posts.length, 20);
        yield posts.isEmpty ? currentState.copyWith(null, false) :
            Success(currentState.posts + posts, false);
      }
    } catch (_) {
      yield Failure();
    }
    yield null;
  }

  bool _hasReachedMax(PostState state) => state is Success && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpclient.get('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rowPost) {
        return Post(
          rowPost['id'],
          rowPost['title'],
          rowPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}