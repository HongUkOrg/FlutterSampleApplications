
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleinifnitelistbloc/model/post.dart';
import 'package:sampleinifnitelistbloc/post/post_event.dart';

import 'post_bloc.dart';
import 'post_state.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = BlocProvider.of<PostBloc>(context);
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        print('state update ${state}');
        if (state is Initial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is Failure) {
          return Center(child: Text('Please check your network state'));
        } else if (state is Success) {
          print('current posts ${state.posts.length}');
          if (state.posts.isEmpty) {
            return Center(child: Text('empty posts'));
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return index >= state.posts.length ?
              BottomLoader() :
              PostWidget(state.posts[index]);
            },
            itemCount: state.hasReachedMax ?
            state.posts.length :
            state.posts.length + 1,
            controller: _scrollController,
          );
        }

        return Text('hello');
      },

    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll > maxScroll) {
      _postBloc.add(FetchPost());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
          child: SizedBox(
            width: 33, height: 33,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
            ),
          )
      ),
    );
  }
}

class PostWidget extends StatelessWidget {

  final Post post;

  const PostWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      child: Card(
        child: ListTile(
          leading: Text(
            '${post.id}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: Text(post.title, style: TextStyle(fontSize: 15.0 ,fontWeight: FontWeight.bold))),
          isThreeLine: true,
          subtitle: Text(post.body),
          dense: true,
        ),
      ),
    );
  }
}
