import 'package:flutter/material.dart';
import 'package:flutter_btu_midterm/data/dummy_data.dart';
import 'package:flutter_btu_midterm/data/models/clothes_model.dart';
import 'package:flutter_btu_midterm/screens/add_screen.dart';
import 'package:flutter_btu_midterm/screens/details_screen.dart';
import 'package:flutter_btu_midterm/screens/edit_screen.dart';
import 'package:flutter_btu_midterm/widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothesList = DUMMY_DATA;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 50),
        itemBuilder: (ctx, index) {
          final clothe = clothesList[index];
          return GestureDetector(
            onLongPress: () {
              Navigator.pushNamed(context, EditScreen.routeName,
                      arguments: {'clothe': clothe, 'index': index})
                  .then((value) => setState(() {}));
            },
            onTap: () {
              Navigator.pushNamed(context, DetailsScreen.routeName,
                  arguments: {'clothe': clothe}).then((res) {
                if (res != null) {
                  setState(() {});
                }
              });
            },
            child: ListItem(
                name: clothe.name,
                imageUrl: clothe.imageUrl,
                size: clothe.size,
                price: clothe.price,
                description: clothe.description),
          );
        },
        itemCount: clothesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9, crossAxisCount: 2, mainAxisSpacing: 25),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddScreen.routeName)
              .then((_) => {setState(() {})});
        },
      ),
    );
  }
}










//  Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the second screen when tapped.
//                 Navigator.pushNamed(context, '/add', arguments: {'count': 15});
//               },
//               child: const Text('navigate screen'),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   border: UnderlineInputBorder(),
//                   labelText: 'Enter your username',
//                 ),
//               ),
//             )
//           ],
//         ),