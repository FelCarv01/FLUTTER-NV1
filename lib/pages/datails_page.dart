import 'package:flutter/material.dart';
import 'package:projeto01/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel args = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Container(
        padding: EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              args.title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 24),
            Text(
              args.body,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Noticia: ${args.id}\nAutor: ${args.userId}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
