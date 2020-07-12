

import 'package:equatable/equatable.dart';
import 'package:sampleinifnitelistbloc/model/post.dart';

abstract class PostState extends Equatable {

  const PostState();

  @override
  List<Object> get props => [];
}
class Initial extends PostState {}
class Failure extends PostState {}
class Success extends PostState {

  final List<Post> posts;
  final bool hasReachedMax;

  const Success(this.posts, this.hasReachedMax);

  Success copyWith(List<Post> posts, bool hasReachedMax) {
    return Success(posts ?? this.posts, hasReachedMax ?? this.hasReachedMax);
  }

  // should add this method to distinguish each state.
  @override

  List<Object> get props {
    return [posts, hasReachedMax];
  }

  @override
  String toString() {
    return 'Success posts length: ${posts.length}, hasReachedmax ${hasReachedMax}';
  }
}