import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apis/FileApiProvider.dart';
import 'package:flutter_app/blocs/FileBloc.dart';
import 'package:flutter_app/blocs/builders/FileBuilder.dart';
import 'package:flutter_app/blocs/events/FileEvent.dart';
import 'package:flutter_app/blocs/states/FileState.dart';
import 'package:flutter_app/components/LoadingIndicator.dart';
import 'package:flutter_app/models/FileModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<FileList> {
  buildList() {}

  Widget buildItem(FileModel model) {
    return Dismissible(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(model.metadata.originalname),
            Text(
              model.length.toString() + ' bit',
              style: TextStyle(fontSize: 14.0),
            )
          ],
        ),
        subtitle: Text(
          DateFormat("HH:mm:ss dd-MM-yyyy")
              .format(DateTime.parse(model.uploadDate).add(Duration(hours: 7))),
          style: TextStyle(fontSize: 12.0),
        ),
      ),
      key: Key(model.id),
      confirmDismiss: (DismissDirection dismissDirection) async {
        print(dismissDirection);
        if (dismissDirection == DismissDirection.startToEnd) {
          fileApiProvider
              .download(model.id, model.metadata.originalname)
              .then((path) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Your file is saved at: $path',
                  style: Theme.of(context).textTheme.button,
                ),
                backgroundColor: Colors.blue,
              ),
            );
          }).catchError((er) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'An error occurred: ${er.message}',
                  style: Theme.of(context).textTheme.button,
                ),
                backgroundColor: Colors.red,
              ),
            );
          });
        }
        return false;
      },
      onDismissed: (DismissDirection dismissDirection) {},
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return fileCreator(fileBuilder((context, state) {
      if (state is FileInitial) {
        List<FileModel> _list = state.list;
        List<Widget> wids = _list.map((item) {
          return buildItem(item);
        }).toList();
        print(wids);
        return RefreshIndicator(
            onRefresh: () async {
              print('reload');
              BlocProvider.of<FileBloc>(context).add(OnLoadFile());
            },
            child: ListView(children: wids));
      }
      return LoadingIndicator();
    }));
  }
}
