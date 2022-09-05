import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Notification',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: const Color.fromARGB(9, 0, 0, 0),
            ),
            width: 20,
            margin: const EdgeInsets.all(8),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          actions: [
            Container(
              width: 55,
              color: Colors.white,
            )
          ],
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: Color.fromARGB(40, 0, 0, 0),
            );
          },
          itemCount: 6,
          itemBuilder: (context, index) {
            return Notif(
              imgUrl: "https://picsum.photos/id/$index/200/300",
              sms: faker.lorem.sentence(),
              waktu: "3 hours",
            );
          },
        ),
      ),
    );
  }
}

class Notif extends StatelessWidget {
  final String imgUrl;
  final String sms;
  final String waktu;

  const Notif(
      {Key? key, required this.imgUrl, required this.sms, required this.waktu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      title: Text(
        sms,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        'about $waktu ago',
        maxLines: 1,
        style: const TextStyle(
          color: Color.fromARGB(100, 0, 0, 0),
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
    );
  }
}
