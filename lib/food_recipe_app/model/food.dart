class Food {
  final String name;
  final String image;
  final Category category;

  Food({required this.name, required this.image, required this.category});
}

enum Category { mexican, chinese, indian, italian, japanese }
