import 'package:flutter/material.dart';
import 'package:just_chat/models/news_model.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  final NewsModel? data;
  const Details({Key? key, this.data}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String setDateFormate() {
    var millisec = widget.data!.dateLong;
    var dt = DateTime.fromMillisecondsSinceEpoch(millisec);
    var datetime = DateFormat('dd/MM/yyyy, HH:mm').format(dt);
    return datetime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailes"),
        backgroundColor: Colors.cyan[400],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
        child: Column(
          children: [
            Image(image: NetworkImage(widget.data!.image)),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              widget.data!.title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              widget.data!.summary,
            ),
            const SizedBox(
              height: 150.0,
            ),
            Row(
              children: [
                Text(
                  setDateFormate(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 90.0,
                ),
                Text(
                  widget.data!.subTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
