import 'package:flutter/material.dart';

double sliverHeight = 200.0;

class MySliverAppBar extends StatelessWidget {
  ScrollController controller;
  final List<Widget> children;

  MySliverAppBar({@required this.controller, @required this.children});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: <Widget>[
        SliverAppBar(
          floating: false,
          pinned: true,
          backgroundColor: Color(0xff4c6adf),
          title: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                    child: TextField(
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                      decoration: const InputDecoration.collapsed(
                        hintText: "Search...",
                        hintStyle:
                        TextStyle(fontSize: 13, color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ),
              Icon(Icons.add_alert)
            ],
          ),
          expandedHeight: sliverHeight,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              "https://i.scdn.co/image/69a0d8f5c79ca4158d1ae47ea498794fc7705a51",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(children),
        )
      ],
    );
  }
}