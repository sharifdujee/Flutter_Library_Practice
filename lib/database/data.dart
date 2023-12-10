import 'package:flutter/material.dart';

import 'Person.dart';

class Database extends StatelessWidget {
  const Database({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Person person = Person(
      name: 'Rahat',
      age: 25,
      friends: ['Arafat', 'Afridi', 'Amit'],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('User Database'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildUserInfoCard(person),
        ),
      ),
    );
  }

  Widget _buildUserInfoCard(Person person) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              person.name,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            Divider(),
            Text(
              'Age:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              person.age.toString(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Divider(),
            Text(
              'Friends:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              person.friends.join(', '),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
