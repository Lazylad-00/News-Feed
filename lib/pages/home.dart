import 'package:flutter/material.dart';
import 'package:just_chat/models/news_model.dart';
import 'package:just_chat/pages/detail_info.dart';
import 'package:just_chat/pages/loading.dart';
import 'package:just_chat/service/api_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<NewsModel>> _newsData;

  @override
  void initState() {
    // TODO: implement initState
    _newsData = ApiManager().getNewsData();
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _newsData = ApiManager().getNewsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text("News Feed"),
        centerTitle: true,
        backgroundColor: Colors.cyan[400],
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: Colors.red,
        strokeWidth: 3,
        displacement: 5,
        edgeOffset: 20,
        child: FutureBuilder<List<NewsModel>>(
          future: _newsData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].subTitle),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data![index].image),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                        data: snapshot.data![index],
                                      )));
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Loading());
            }
          },
        ),
      ),
    );
  }
}
