import 'package:clean_arch/application/core/services/theme_services.dart';
import 'package:clean_arch/application/features/posts/postbloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: PostPage(),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PostApp using Bloc",
          style: themeData.textTheme.titleSmall,
        ),
        actions: [
          Switch(
              activeColor: Colors.green,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              inactiveTrackColor: Colors.blueGrey,
              inactiveThumbColor: Colors.black87,
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context, listen: false)
                    .toggleTheme();
              }),
          IconButton(
              onPressed: () {
                BlocProvider.of<PostBloc>(context).add(PostRequestsEvent());
              },
              icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All posts",
              style: themeData.textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostInitial) {
                  return Text("posts are watating loaded");
                } else if (state is PostStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.pink),
                  );
                } else if (state is PostStateLoaded) {
                  return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final item = state.posts[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Center(
                                child: Text("${index + 1}"),
                              ),
                            ),
                            title: Text(item['title']),
                            subtitle: Text(item['description']),
                          ),
                        );
                      });
                } else if (state is PostStateError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return Text("server error");
                }
              },
            )),

            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return Card(
            //           child: ListTile(
            //             leading: CircleAvatar(
            //               child: Center(
            //                 child: Text("${index + 1}"),
            //               ),
            //             ),
            //             title: Text("post one"),
            //             subtitle: Text("posts one body"),
            //           ),
            //         );
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
