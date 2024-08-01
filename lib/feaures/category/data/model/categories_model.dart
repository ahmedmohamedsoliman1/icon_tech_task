class CategoriesModel {
  bool? status;
  String? msg;
  List<AllCategoriesData>? data;

  CategoriesModel({this.status, this.msg, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <AllCategoriesData>[];
      json['data'].forEach((v) {
        data!.add(new AllCategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCategoriesData {
  int? id;
  Title? title;
  int? isActive;
  String? image;
  int? order;
  String? createdAt;
  Null? updatedAt;
  int? companyId;
  int? refId;

  AllCategoriesData(
      {this.id,
        this.title,
        this.isActive,
        this.image,
        this.order,
        this.createdAt,
        this.updatedAt,
        this.companyId,
        this.refId});

  AllCategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    isActive = json['is_active'];
    image = json['image'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyId = json['company_id'];
    refId = json['ref_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_id'] = this.companyId;
    data['ref_id'] = this.refId;
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}