class CategoryModel1 {
  String? catName;
  Sizes? sizes;

  CategoryModel1({this.catName, this.sizes});

  CategoryModel1.fromJson(Map<String, dynamic> json) {
    catName = json['CatName'];
    sizes = json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CatName'] = catName;
    if (sizes != null) {
      data['sizes'] = sizes!.toJson();
    }
    return data;
  }
}

class Sizes {
  int? xS;
  int? s;
  int? m;
  int? l;
  int? xL;
  int? i2XL;
  int? i3XL;
  int? i4XL;
  int? i5XL;
  int? i6XL;
  int? i7XL;

  Sizes(
      {this.xS,
      this.s,
      this.m,
      this.l,
      this.xL,
      this.i2XL,
      this.i3XL,
      this.i4XL,
      this.i5XL,
      this.i6XL,
      this.i7XL});

  Sizes.fromJson(Map<String, dynamic> json) {
    xS = json['XS'];
    s = json['S'];
    m = json['M'];
    l = json['L'];
    xL = json['XL'];
    i2XL = json['2XL'];
    i3XL = json['3XL'];
    i4XL = json['4XL'];
    i5XL = json['5XL'];
    i6XL = json['6XL'];
    i7XL = json['7XL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['XS'] = xS;
    data['S'] = s;
    data['M'] = m;
    data['L'] = l;
    data['XL'] = xL;
    data['2XL'] = i2XL;
    data['3XL'] = i3XL;
    data['4XL'] = i4XL;
    data['5XL'] = i5XL;
    data['6XL'] = i6XL;
    data['7XL'] = i7XL;
    return data;
  }
}
