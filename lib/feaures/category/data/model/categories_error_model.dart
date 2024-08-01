class CategoriesErrorModel {
  bool? status;
  String? msg;
  List<AllCategoriesErrorData>? data;

  CategoriesErrorModel({this.status, this.msg, this.data});

  CategoriesErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <AllCategoriesErrorData>[];
      json['data'].forEach((v) {
        data!.add(new AllCategoriesErrorData.fromJson(v));
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

class AllCategoriesErrorData {
  String? ar;
  String? en;

  AllCategoriesErrorData({this.ar, this.en});

  AllCategoriesErrorData.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}