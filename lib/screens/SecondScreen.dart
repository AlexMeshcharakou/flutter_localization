import 'package:flutter/material.dart';
import 'package:module_nine/model/photo.dart';
import 'package:module_nine/services/app_routes.dart';
import 'package:module_nine/services/network_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.secondScreen),
        ),
        body: FutureBuilder(
          future: NetworkService().get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
            return ListView(
              children: (snapshot.data as List<Photo>)
                  .map(
                    (photo) => MyListTile(photo: photo),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final dynamic photo;

  const MyListTile({
    Key? key,
    this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.homeScreen,
            arguments: photo.toString(),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 270,
          height: 110,
          child: Center(
            child: Text(
              photo.toString(),
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
