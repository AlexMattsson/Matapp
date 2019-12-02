import 'package:flutter/material.dart';

class VoteIcon extends StatefulWidget {

    final IconData icon;
    final Color color;
    final Function onPressed;

    VoteIcon({
        @required this.icon,
        @required this.color,
        @required this.onPressed,
    });

    @override
    _VoteIconState createState() => _VoteIconState();
}

class _VoteIconState extends State<VoteIcon> {
    @override
    Widget build(BuildContext context) {
        return SizedBox(
            height: 70.0,
            width: 70.0,
            child: IconButton(
                padding: EdgeInsets.all(0.0),
                color: widget.color,
                icon: Icon(widget.icon, size: 70.0),
                onPressed: widget.onPressed,
            ),
        );
    }
}
