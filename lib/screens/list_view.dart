import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  var userList = <Map<String, dynamic>>[
    {
      'name': 'Amaan',
      'age': 20,
      'image':
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
    },
    {
      'name': 'Ali',
      'age': 30,
      'image':
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
    },
    {
      'name': 'Bilal',
      'age': 50,
      'image':
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
    },
    {
      'name': 'Ibrar',
      'age': 90,
      'image':
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
    },
    {
      'name': 'Umer',
      'age': 55,
      'image':
          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"
    }
  ];

  var myList = [];
  
  void sortInAsc() {
    myList.sort((a, b) => (a['age']).compareTo(b['age']));
    setState(() {});
  }
  void sortInDesc() {
    myList.sort((a, b) => (b['age']).compareTo(a['age']));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    myList = userList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: TextField(
                  onChanged: (String enterChar) {
                    var resultList = [];
                    if (enterChar.isEmpty) {
                      resultList = userList;
                    } else {
                      resultList = userList
                          .where((element) => element["name"]
                              .toLowerCase()
                              .contains(enterChar.toLowerCase()))
                          .toList();
                    }

                    setState(() {
                      myList = resultList;
                    });
                  },
                  decoration: InputDecoration(
                      label: const Text('Search'),
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: const Icon(Icons.search),
                      suffixIconColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2))),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_upward),
              iconSize: 30,
              color: Colors.white,
              onPressed: sortInAsc,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_downward_outlined),
              iconSize: 30,
              color: Colors.white,
              onPressed: sortInDesc,
            )
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'))),
                  title: Text(myList[index]['name'].toString()),
                  subtitle: Text(myList[index]['age'].toString()),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(color: Color(0xFFFFB100), thickness: 2);
              },
              itemCount: myList.length),
        ))
      ],
    );
  }
}
