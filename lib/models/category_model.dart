// ignore_for_file: non_constant_identifier_names

class ShCategory {
  int? count;
  String? description;
  int? id;
  bool? isSelected;
  int? menu_order;
  String? name;
  int? parent;
  String? slug;
  String? image;

  ShCategory(
      {this.count,
      this.description,
      this.id,
      this.isSelected,
      this.menu_order,
      this.name,
      this.parent,
      this.slug,
      this.image});

  factory ShCategory.fromJson(Map<String, dynamic> json) {
    return ShCategory(
        count: json['count'],
        description: json['description'],
        id: json['id'],
        isSelected: json['isSelected'],
        menu_order: json['menu_order'],
        name: json['name'],
        parent: json['parent'],
        slug: json['slug'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['description'] = description;
    data['id'] = id;
    data['isSelected'] = isSelected;
    data['menu_order'] = menu_order;
    data['name'] = name;
    data['parent'] = parent;
    data['slug'] = slug;
    return data;
  }
}
