import 'package:flutter/material.dart';
import 'package:flutter_book/screens/category_items.dart';

class GridDashboard extends StatelessWidget {
  Category item1 = new Category(
      name: 'C/C++',
      img:
          "https://hri.com.vn/wp-content/uploads/bfi_thumb/c-oxylp5x7k4wjjh5ov9euuqs1cea47b0kdogs07ffrq.png");

  Category item2 = new Category(
    name: 'Flutter',
    img:
        "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
  );
  Category item3 = new Category(
    name: 'AI',
    img:
        "https://ictvietnam.mediacdn.vn/162041676108402688/2020/4/24/2-15877150012501442735277.jpg",
  );
  Category item4 = new Category(
    name: 'Blockchain',
    img:
        "https://gfsblockchain.com/wp-content/uploads/2022/04/3b64d152-6810-413a-99cf-19ae5f7fb8a7_Blockchain2520Technology-scaled-1.jpg",
  );
  Category item5 = new Category(
    name: 'Golang',
    img: "https://miro.medium.com/max/500/1*vmFSpk9xtpxAHkH7cmt-3Q.png",
  );
  Category item6 = new Category(
    name: 'Golang',
    img: "https://miro.medium.com/max/500/1*vmFSpk9xtpxAHkH7cmt-3Q.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Category> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xffF2EBE9;
    return GridView.count(
        shrinkWrap: true,
        // physics: BouncingScrollPhysics as ScrollPhysics?,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryItemsScreen()),
                );
              },
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 4,
                      )
                    ]),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.img,
                          width: 42,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent
                                  ]))),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(data.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList());
  }
}

class Category {
  String name;
  String img;
  Category({required this.name, required this.img});
}
