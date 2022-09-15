import '../models/item_model.dart';

ItemModel item1 = ItemModel(
  name: 'Garlic Burger',
  category: 'Burgers',
  description:
      'Um ode ao alho, hambúrguer com alho no seu melhor momento. Blend de carnes Angus. Pão brioche.',
  image: 'assets/images/garlic-burger.jpg',
  currency: 'R\$',
  price: 29.99,
  unit: 'un',
  rating: 4.5,
  reviews: 23,
  isFavorite: true,
  isPopular: true,
);

ItemModel item2 = ItemModel(
  name: 'Burger Supreme',
  category: 'Burgers',
  description:
      'Burger com o molho Supreme, incrível sabor de Churrasco, com toque do Chef. Blend de carnes Angus. Pão brioche.',
  image: 'assets/images/burger-supreme.jpg',
  currency: 'R\$',
  price: 43.90,
  unit: 'un',
  rating: 4.7,
  reviews: 15,
  isFavorite: true,
  isPopular: true,
);

ItemModel item3 = ItemModel(
  name: 'Veggie Burger',
  category: 'Burgers',
  description:
      'Maravilhoso hambúrguer vegano, com blend de legumes, temperado com ervas e especiarias. Pão brioche.',
  image: 'assets/images/veggie-burger.jpg',
  currency: 'R\$',
  price: 32.90,
  unit: 'un',
  rating: 4.9,
  reviews: 31,
  isFavorite: true,
  isPopular: true,
);

ItemModel item4 = ItemModel(
  name: 'Combo Trio Burger',
  category: 'Burgers',
  description:
      'O mais completo combo de hambúrgueres. 3 hambúrgueres. Sabores variados. Todos com blend de carnes Angus. Pão brioche.',
  image: 'assets/images/trio-burger.jpg',
  currency: 'R\$',
  price: 79.90,
  unit: 'un',
  rating: 4.3,
  reviews: 27,
  isFavorite: true,
  isPopular: true,
);

ItemModel item5 = ItemModel(
  name: 'Smash Burger',
  category: 'Burgers',
  description:
      'Blend exclusivo de carne Angus no melhor estilo smash burger. Pão brioche.',
  image: 'assets/images/smash-burger.jpg',
  currency: 'R\$',
  price: 25.90,
  unit: 'un',
  rating: 4.6,
  reviews: 54,
  isFavorite: true,
  isPopular: true,
);

ItemModel item6 = ItemModel(
  name: 'Cheeseburger',
  category: 'Burgers',
  description:
      'Impressionante cheeseburger com blend exclusivo de carne Angus e queijo cheddar. Pão brioche.',
  image: 'assets/images/cheese-burger.jpg',
  currency: 'R\$',
  price: 25.90,
  unit: 'un',
  rating: 4.6,
  reviews: 54,
  isFavorite: true,
  isPopular: true,
);

ItemModel item7 = ItemModel(
  name: 'Pizza',
  category: 'Pizzas',
  description: 'Pizza with cheese',
  image: 'assets/images/pizza.png',
  currency: 'R\$',
  price: 15.0,
  unit: 'un',
  rating: 4.5,
  reviews: 23,
  isFavorite: true,
  isPopular: true,
);

ItemModel item8 = ItemModel(
  name: 'Sandwich',
  category: 'Sandwiches',
  description: 'Sandwich with cheese',
  image: 'assets/images/sandwich.png',
  currency: 'R\$',
  price: 12.0,
  unit: 'un',
  rating: 4.5,
  reviews: 23,
  isFavorite: true,
  isPopular: true,
);

ItemModel item9 = ItemModel(
  name: 'Salad',
  category: 'Saladas',
  description: 'Salad with cheese',
  image: 'assets/images/salad.png',
  currency: 'R\$',
  price: 8.0,
  unit: 'un',
  rating: 4.5,
  reviews: 23,
  isFavorite: true,
  isPopular: true,
);

ItemModel item10 = ItemModel(
  name: 'Pasta',
  category: 'Pastas',
  description: 'Pasta with cheese',
  image: 'assets/images/pasta.png',
  currency: 'R\$',
  price: 9.0,
  unit: 'un',
  rating: 4.5,
  reviews: 23,
  isFavorite: true,
  isPopular: true,
);

ItemModel item11 = ItemModel(
  name: 'Dessert',
  category: 'Sobremesas',
  description: 'Dessert with cheese',
  image: 'assets/images/dessert.png',
  currency: 'R\$',
  price: 7.0,
  unit: 'un',
  rating: 4.5,
  reviews: 23,
  isFavorite: true,
  isPopular: true,
);

List<ItemModel> items = [
  item1,
  item2,
  item3,
  item4,
  item5,
  item6,
];

List<String> categories = [
  'Burgers',
  'Fast Food',
  'Pizzas',
  'Pastas',
  'Saladas',
  'Sanduíches',
  'Sobremesas',
];
