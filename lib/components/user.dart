import 'package:flutter/material.dart';
import 'package:habitum3/bloc/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(top: 35, left: 20),
          child: GestureDetector(
            child: CircleAvatar(
              child: Icon(
                Icons.supervised_user_circle,
                size: 60,
              ),
              backgroundColor: Colors.white54,
              radius: 35.0,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('user');
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${bloc.email}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Puntuacion: 0",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
