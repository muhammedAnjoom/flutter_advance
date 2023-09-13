class MealModel {
  List<Categories>? _categories;

  MealModel({List<Categories>? categories}) {
    if (categories != null) {
      this._categories = categories;
    }
  }

  List<Categories>? get categories => _categories;
  set categories(List<Categories>? categories) => _categories = categories;

  MealModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      _categories = <Categories>[];
      json['categories'].forEach((v) {
        _categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._categories != null) {
      data['categories'] = this._categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? _idCategory;
  String? _strCategory;
  String? _strCategoryThumb;
  String? _strCategoryDescription;

  Categories(
      {String? idCategory,
      String? strCategory,
      String? strCategoryThumb,
      String? strCategoryDescription}) {
    if (idCategory != null) {
      this._idCategory = idCategory;
    }
    if (strCategory != null) {
      this._strCategory = strCategory;
    }
    if (strCategoryThumb != null) {
      this._strCategoryThumb = strCategoryThumb;
    }
    if (strCategoryDescription != null) {
      this._strCategoryDescription = strCategoryDescription;
    }
  }

  String? get idCategory => _idCategory;
  set idCategory(String? idCategory) => _idCategory = idCategory;
  String? get strCategory => _strCategory;
  set strCategory(String? strCategory) => _strCategory = strCategory;
  String? get strCategoryThumb => _strCategoryThumb;
  set strCategoryThumb(String? strCategoryThumb) =>
      _strCategoryThumb = strCategoryThumb;
  String? get strCategoryDescription => _strCategoryDescription;
  set strCategoryDescription(String? strCategoryDescription) =>
      _strCategoryDescription = strCategoryDescription;

  Categories.fromJson(Map<String, dynamic> json) {
    _idCategory = json['idCategory'];
    _strCategory = json['strCategory'];
    _strCategoryThumb = json['strCategoryThumb'];
    _strCategoryDescription = json['strCategoryDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCategory'] = this._idCategory;
    data['strCategory'] = this._strCategory;
    data['strCategoryThumb'] = this._strCategoryThumb;
    data['strCategoryDescription'] = this._strCategoryDescription;
    return data;
  }
}