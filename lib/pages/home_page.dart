import 'package:flutter/material.dart';
import 'package:projeto01/controllers/home_controller.dart';
import 'package:projeto01/models/post_model.dart';
import 'package:projeto01/repositories/home_repository_imp.dart';
import 'package:projeto01/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeReposityImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
            },
            icon: Icon(Icons.logout),
          )
        ],
        centerTitle: true,
        title: Text(
          'Home',
        ),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              onTap: () => Navigator.of(context)
                  .pushNamed('/details', arguments: list[index]),
              leading: Text(list[index].id.toString()),
              title: Text(
                list[index].title,
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(),
          );
        },
      ),
    );
  }
}
