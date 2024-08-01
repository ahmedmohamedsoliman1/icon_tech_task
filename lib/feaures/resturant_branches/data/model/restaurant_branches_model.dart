class RestaurantBranchesModel {
  bool? status;
  String? msg;
  List<AllRestaurantBranchesData>? data;

  RestaurantBranchesModel({this.status, this.msg, this.data});

  RestaurantBranchesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <AllRestaurantBranchesData>[];
      json['data'].forEach((v) {
        data!.add(new AllRestaurantBranchesData.fromJson(v));
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

class AllRestaurantBranchesData {
  int? id;
  Title? title;
  String? phone;
  int? isActive;
  String? image;
  String? lat;
  String? long;
  String? morningTimeFrom;
  String? morningTimeTo;
  String? eveningTimeFrom;
  String? eveningTimeTo;
  Null? busyAt;
  String? busyHours;
  int? popupCategoryId;
  int? popupProductId;
  String? popupPhoto;
  int? showPopup;
  String? createdAt;
  String? updatedAt;
  String? instagram;
  String? twitter;
  Title? address;
  int? minTotalOrder;
  String? deliveryTimeFrom;
  String? deliveryTimeTo;
  String? code;
  String? taxNumber;
  int? companyId;
  String? qrImage;
  int? isWaitingList;
  int? waitingListNotifyCount;
  int? refId;
  String? statusEn;
  String? statusAr;
  int? statusNo;
  double? distance;
  int? inFavourite;
  dynamic rate;
  Title? popupCategoryTitle;
  List<BranchOrderMethod>? branchOrderMethod;
  Company? company;

  AllRestaurantBranchesData(
      {this.id,
        this.title,
        this.phone,
        this.isActive,
        this.image,
        this.lat,
        this.long,
        this.morningTimeFrom,
        this.morningTimeTo,
        this.eveningTimeFrom,
        this.eveningTimeTo,
        this.busyAt,
        this.busyHours,
        this.popupCategoryId,
        this.popupProductId,
        this.popupPhoto,
        this.showPopup,
        this.createdAt,
        this.updatedAt,
        this.instagram,
        this.twitter,
        this.address,
        this.minTotalOrder,
        this.deliveryTimeFrom,
        this.deliveryTimeTo,
        this.code,
        this.taxNumber,
        this.companyId,
        this.qrImage,
        this.isWaitingList,
        this.waitingListNotifyCount,
        this.refId,
        this.statusEn,
        this.statusAr,
        this.statusNo,
        this.distance,
        this.inFavourite,
        this.rate,
        this.popupCategoryTitle,
        this.branchOrderMethod,
        this.company});

  AllRestaurantBranchesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    phone = json['phone'];
    isActive = json['is_active'];
    image = json['image'];
    lat = json['lat'];
    long = json['long'];
    morningTimeFrom = json['morning_time_from'];
    morningTimeTo = json['morning_time_to'];
    eveningTimeFrom = json['evening_time_from'];
    eveningTimeTo = json['evening_time_to'];
    busyAt = json['busy_at'];
    busyHours = json['busy_hours'];
    popupCategoryId = json['popup_category_id'];
    popupProductId = json['popup_product_id'];
    popupPhoto = json['popup_photo'];
    showPopup = json['show_popup'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    address =
    json['address'] != null ? new Title.fromJson(json['address']) : null;
    minTotalOrder = json['min_total_order'];
    deliveryTimeFrom = json['delivery_time_from'];
    deliveryTimeTo = json['delivery_time_to'];
    code = json['code'];
    taxNumber = json['tax_number'];
    companyId = json['company_id'];
    qrImage = json['qr_image'];
    isWaitingList = json['is_waiting_list'];
    waitingListNotifyCount = json['waiting_list_notify_count'];
    refId = json['ref_id'];
    statusEn = json['status_en'];
    statusAr = json['status_ar'];
    statusNo = json['status_no'];
    distance = json['distance'];
    inFavourite = json['in_favourite'];
    rate = json['rate'];
    popupCategoryTitle = json['popup_category_title'] != null
        ? new Title.fromJson(json['popup_category_title'])
        : null;
    if (json['branch_order_method'] != null) {
      branchOrderMethod = <BranchOrderMethod>[];
      json['branch_order_method'].forEach((v) {
        branchOrderMethod!.add(new BranchOrderMethod.fromJson(v));
      });
    }
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['phone'] = this.phone;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['morning_time_from'] = this.morningTimeFrom;
    data['morning_time_to'] = this.morningTimeTo;
    data['evening_time_from'] = this.eveningTimeFrom;
    data['evening_time_to'] = this.eveningTimeTo;
    data['busy_at'] = this.busyAt;
    data['busy_hours'] = this.busyHours;
    data['popup_category_id'] = this.popupCategoryId;
    data['popup_product_id'] = this.popupProductId;
    data['popup_photo'] = this.popupPhoto;
    data['show_popup'] = this.showPopup;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['min_total_order'] = this.minTotalOrder;
    data['delivery_time_from'] = this.deliveryTimeFrom;
    data['delivery_time_to'] = this.deliveryTimeTo;
    data['code'] = this.code;
    data['tax_number'] = this.taxNumber;
    data['company_id'] = this.companyId;
    data['qr_image'] = this.qrImage;
    data['is_waiting_list'] = this.isWaitingList;
    data['waiting_list_notify_count'] = this.waitingListNotifyCount;
    data['ref_id'] = this.refId;
    data['status_en'] = this.statusEn;
    data['status_ar'] = this.statusAr;
    data['status_no'] = this.statusNo;
    data['distance'] = this.distance;
    data['in_favourite'] = this.inFavourite;
    data['rate'] = this.rate;
    if (this.popupCategoryTitle != null) {
      data['popup_category_title'] = this.popupCategoryTitle!.toJson();
    }
    if (this.branchOrderMethod != null) {
      data['branch_order_method'] =
          this.branchOrderMethod!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
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

class BranchOrderMethod {
  int? id;
  Title? title;
  int? isActive;
  String? image;
  String? createdAt;
  Pivot? pivot;

  BranchOrderMethod(
      {this.id,
        this.title,
        this.isActive,
        this.image,
        this.createdAt,
        this.pivot});

  BranchOrderMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    isActive = json['is_active'];
    image = json['image'];
    createdAt = json['created_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? branchId;
  int? orderMethodId;

  Pivot({this.branchId, this.orderMethodId});

  Pivot.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    orderMethodId = json['order_method_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['order_method_id'] = this.orderMethodId;
    return data;
  }
}

class Company {
  int? id;
  Title? title;
  String? phone;
  int? isActive;
  String? image;
  String? createdAt;
  String? updatedAt;
  Title? about;
  Title? termsConditions;
  String? email;

  Company(
      {this.id,
        this.title,
        this.phone,
        this.isActive,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.about,
        this.termsConditions,
        this.email});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    phone = json['phone'];
    isActive = json['is_active'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    about = json['about'] != null ? new Title.fromJson(json['about']) : null;
    termsConditions = json['terms_conditions'] != null
        ? new Title.fromJson(json['terms_conditions'])
        : null;
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['phone'] = this.phone;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.about != null) {
      data['about'] = this.about!.toJson();
    }
    if (this.termsConditions != null) {
      data['terms_conditions'] = this.termsConditions!.toJson();
    }
    data['email'] = this.email;
    return data;
  }
}