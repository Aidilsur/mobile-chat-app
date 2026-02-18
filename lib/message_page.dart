import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("Recent", style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _RecentContact(
                  key: ValueKey('Bary'),
                  name: 'Barry',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
                _RecentContact(
                  key: ValueKey('Perez'),
                  name: 'Perez',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
                _RecentContact(
                  key: ValueKey('Alvin'),
                  name: 'Alvin',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
                _RecentContact(
                  key: ValueKey('Dan'),
                  name: 'Dan',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
                _RecentContact(
                  key: ValueKey('Frank'),
                  name: 'Frank',
                  imageUrl: 'https://via.placeholder.com/150',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                children: [
                  _MessageTile(
                    name: 'Danny H',
                    message: 'dany@gmail.com',
                    time: '08:43',
                  ),
                  _MessageTile(
                    name: 'Bobby M',
                    message: 'bobby@gmail.com',
                    time: '08:43',
                  ),
                  _MessageTile(
                    name: 'Mike A',
                    message: 'mike@gmail.com',
                    time: '08:43',
                  ),
                  _MessageTile(
                    name: 'Fabrice O',
                    message: 'fabrice@gmail.com',
                    time: '08:43 ',
                  ),
                  _MessageTile(
                    name: 'Fabio U',
                    message: 'fabio@gmail.com',
                    time: '08:43',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentContact extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _RecentContact({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(height: 5),
          Text(name, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final String name;
  final String message;
  final String time;

  const _MessageTile({
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey, overflow: TextOverflow.ellipsis),
      ),
      trailing: Text(time, style: TextStyle(color: Colors.grey)),
    );
  }
}
