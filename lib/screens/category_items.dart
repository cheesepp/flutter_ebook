import 'package:flutter/material.dart';
import 'package:flutter_book/screens/book_details_screen/book_details_screen.dart';

class CategoryItemsScreen extends StatelessWidget {
  const CategoryItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back)),
            floating: true,
            pinned: true,
            forceElevated: true, //* here
            elevation: 20,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://hri.com.vn/wp-content/uploads/bfi_thumb/c-oxylp5x7k4wjjh5ov9euuqs1cea47b0kdogs07ffrq.png',
                fit: BoxFit.cover,
              ),
              title: Text(
                'C/C++',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          buildImages()
        ],
      ),
    );
  }

  Widget buildImages() => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          primary: false,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookDetailsScreen()));
            },
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 7,
                        offset: const Offset(5, 5),
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        // "assets/images/0.jfif",
                        'https://images-na.ssl-images-amazon.com/images/I/71d2WrAUznL.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    'hủhfuhurr',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                // const SizedBox(
                //   height: 30,
                // ),
              ],
            ),
          ),
        ),
      );
}
