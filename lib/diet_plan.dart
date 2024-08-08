import 'package:flutter/material.dart';

class DietPlanPage extends StatefulWidget {
  const DietPlanPage({Key? key}) : super(key: key);

  @override
  State<DietPlanPage> createState() => _DietPlanPageState();
}

class _DietPlanPageState extends State<DietPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25), // Added sized box
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Diet Plan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDietContainer(
                    dietName: 'Breakfast',
                    dishName: 'Sandwich',
                    protein: '141g',
                    imageUrl:
                        'https://c.ndtvimg.com/2019-02/jqvg9kq8_low-calorie-diet-sandwich-spreads_625x300_20_February_19.jpg',
                  ),
                  _buildDietContainer(
                    dietName: 'Lunch',
                    dishName: 'Tuna Salad',
                    protein: '141g',
                    imageUrl:
                        'https://hips.hearstapps.com/hmg-prod/images/delish-230516-tuna-salad-047-rl-index-6478b7136bfd3.jpg?crop=0.888888888888889xw:1xh;center,top&resize=1200:*',
                  ),
                  _buildDietContainer(
                    dietName: 'Dinner',
                    dishName: 'Salmon with Sweet Potato',
                    protein: '141g',
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-SctdBZYltmhjt3l6EA5ebekznuZnxTHzlaBsNmMR_w&s',
                  ),
                  _buildDietContainer(
                    dietName: 'Snack',
                    dishName: 'Yogurt and Berries',
                    protein: '141g',
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT34IOy5jxeOoOa-cuyt9uhnVH5BlEBa-8uAy_uCwk9pA&s',
                  ),
                  _buildDietContainer(
                    dietName: 'Dessert',
                    dishName: 'Apple Peanut Butter',
                    protein: '141g',
                    imageUrl:
                        'https://www.imperialsugar.com/sites/default/files/recipe/apple-peanut-butter-sandwiches-imperial.jpg',
                  ),
                  _buildDietContainer(
                    dietName: 'Supper',
                    dishName: 'Mashroom soup with veggies salad',
                    protein: '141g',
                    imageUrl:
                        'https://www.recipetineats.com/wp-content/uploads/2021/04/Mushroom-Soup-in-bowl.jpg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 25), // Added sized box
            _buildSearchBar(),
            SizedBox(height: 25), // Added sized box
            _buildFoodItemsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDietContainer({
    required String dietName,
    required String dishName,
    required String protein,
    required String imageUrl,
  }) {
    return Container(
      width: 200, // Fixed width for all containers
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dietName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              'Dish: $dishName',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Protein: $protein',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Food',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItemsList() {
    List<Map<String, String>> foodItems = [
      {
        'name': 'Chicken',
        'protein': '24g',
        'imageUrl':
            'https://static.thcdn.com/images/v2/wp-content/uploads/sites/478/2015/01/27234337/chkck.jpg?width=700'
      },
      {
        'name': 'Turkey breast/turkey mince',
        'protein': '17g',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmucpg-sI2ZtJiIyZu58XuDSw7qvMqlVWz3KoxBuym8g&s'
      },
      {
        'name': 'Peanut butter',
        'protein': '25g',
        'imageUrl':
            'https://static.thcdn.com/images/v2/wp-content/uploads/sites/478/2015/01/27234332/butter.jpg?width=700'
      },
      {
        'name': 'Sardines',
        'protein': '24g',
        'imageUrl': 'https://5.imimg.com/data5/NN/YB/MY-4968409/sardines.jpg'
      },
      {
        'name': 'Tinned Salmon',
        'protein': '17g',
        'imageUrl':
            'https://www.eatthis.com/wp-content/uploads/sites/4/2021/09/salmon-can.jpg?quality=82&strip=1'
      },
      {
        'name': 'Greek style yoghurt',
        'protein': '5-7g',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTup-9U96GyX5gteRXoLdcvtOaj4R2mt889GZnWjpWzf0ovFXm4Zy-rflWZvs7T-jz74Bg&usqp=CAU'
      },
      {
        'name': 'Eggs',
        'protein': '6g',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqWNDCyIq_-0Bgb0TvTd0Xz92vaihXgPxoae6uFqCavw&s'
      },
      {
        'name': 'Myprotein Impact Whey',
        'protein': '82g',
        'imageUrl':
            'https://static.thcdn.com/productimg/1600/1600/11870297-1044723274728347.jpg'
      },
      {
        'name': 'Chorizo',
        'protein': '25g',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo265ppB6yR19jI_JPqaKSj7mfOhgSZECDirZ0WXKyeQ&s'
      },
      {
        'name': 'Green peas',
        'protein': '5.5g',
        'imageUrl':
            'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2022/08/17111101/Shutterstock-Images-17.jpg'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'High Protein Foods',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            return _buildFoodItemContainer(
              foodName: foodItem['name']!,
              protein: foodItem['protein']!,
              imageUrl: foodItem['imageUrl']!,
            );
          },
        ),
      ],
    );
  }

  Widget _buildFoodItemContainer({
    required String foodName,
    required String protein,
    required String imageUrl,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Protein: $protein',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DietPlanPage(),
  ));
}
