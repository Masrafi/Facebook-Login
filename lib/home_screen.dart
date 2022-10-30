import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class HomeScreen extends StatefulWidget {
  var mapData;
  HomeScreen({Key? key, required this.mapData}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CachedNetworkImage(
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              imageUrl: widget.mapData["picture"]["data"]["url"],
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
            ),
          ),
          // Image.network(_userObj["picture"]["data"]["url"]),
          Center(child: Text(widget.mapData["name"] ?? "null")),
          Center(child: Text(widget.mapData["email"] ?? 'Email not found')),
          Center(
            child: TextButton(
                onPressed: () {
                  FacebookAuth.instance.logOut().then((value) {
                    setState(() {
                      Navigator.pop(context);
                    });
                  });
                },
                child: const Text("Logout")),
          )
        ],
      ),
    );
  }
}
