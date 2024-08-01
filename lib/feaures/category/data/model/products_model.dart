class ProductsModel {
  bool? status;
  String? msg;
  ProductsData? data;

  ProductsModel({this.status, this.msg, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new ProductsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProductsData {
  int? currentPage;
  List<AllProductsData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null nextPageUrl;
  String? path;
  String? perPage;
  Null prevPageUrl;
  int? to;
  int? total;

  ProductsData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  ProductsData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <AllProductsData>[];
      json['data'].forEach((v) {
        data!.add(new AllProductsData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class AllProductsData {
  int? id;
  Title? title;
  Title? description;
  Sensitive? sensitive;
  String? calories;
  int? price;
  int? newPrice;
  int? isActive;
  int? isSlider;
  int? isMorning;
  int? isEvening;
  int? indexnum;
  int? recommend;
  int? denyCoupon;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? sliderImage;
  int? maxQuantity;
  int? limitClientCount;
  int? departmentId;
  int? unitId;
  int? customerPrice;
  String? itemCode;
  String? itemName;
  int? inPos;
  int? inMobile;
  int? companyId;
  int? refId;
  int? attributesCount;
  int? inFavourite;
  LastImage? lastImage;
  int? clientCurrentCount;
  String? titleMix;
  List<Images>? images;
  Pivot? pivot;

  AllProductsData(
      {this.id,
        this.title,
        this.description,
        this.sensitive,
        this.calories,
        this.price,
        this.newPrice,
        this.isActive,
        this.isSlider,
        this.isMorning,
        this.isEvening,
        this.indexnum,
        this.recommend,
        this.denyCoupon,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.sliderImage,
        this.maxQuantity,
        this.limitClientCount,
        this.departmentId,
        this.unitId,
        this.customerPrice,
        this.itemCode,
        this.itemName,
        this.inPos,
        this.inMobile,
        this.companyId,
        this.refId,
        this.attributesCount,
        this.inFavourite,
        this.lastImage,
        this.clientCurrentCount,
        this.titleMix,
        this.images,
        this.pivot});

  AllProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    sensitive = json['sensitive'] != null
        ? new Sensitive.fromJson(json['sensitive'])
        : null;
    calories = json['calories'];
    price = json['price'];
    newPrice = json['new_price'];
    isActive = json['is_active'];
    isSlider = json['is_slider'];
    isMorning = json['is_morning'];
    isEvening = json['is_evening'];
    indexnum = json['indexnum'];
    recommend = json['recommend'];
    denyCoupon = json['deny_coupon'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sliderImage = json['slider_image'];
    maxQuantity = json['max_quantity'];
    limitClientCount = json['limit_client_count'];
    departmentId = json['department_id'];
    unitId = json['unit_id'];
    customerPrice = json['customer_price'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    inPos = json['in_pos'];
    inMobile = json['in_mobile'];
    companyId = json['company_id'];
    refId = json['ref_id'];
    attributesCount = json['attributes_count'];
    inFavourite = json['in_favourite'];
    lastImage = json['last_image'] != null
        ? new LastImage.fromJson(json['last_image'])
        : null;
    clientCurrentCount = json['client_current_count'];
    titleMix = json['title_mix'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.sensitive != null) {
      data['sensitive'] = this.sensitive!.toJson();
    }
    data['calories'] = this.calories;
    data['price'] = this.price;
    data['new_price'] = this.newPrice;
    data['is_active'] = this.isActive;
    data['is_slider'] = this.isSlider;
    data['is_morning'] = this.isMorning;
    data['is_evening'] = this.isEvening;
    data['indexnum'] = this.indexnum;
    data['recommend'] = this.recommend;
    data['deny_coupon'] = this.denyCoupon;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['slider_image'] = this.sliderImage;
    data['max_quantity'] = this.maxQuantity;
    data['limit_client_count'] = this.limitClientCount;
    data['department_id'] = this.departmentId;
    data['unit_id'] = this.unitId;
    data['customer_price'] = this.customerPrice;
    data['item_code'] = this.itemCode;
    data['item_name'] = this.itemName;
    data['in_pos'] = this.inPos;
    data['in_mobile'] = this.inMobile;
    data['company_id'] = this.companyId;
    data['ref_id'] = this.refId;
    data['attributes_count'] = this.attributesCount;
    data['in_favourite'] = this.inFavourite;
    if (this.lastImage != null) {
      data['last_image'] = this.lastImage!.toJson();
    }
    data['client_current_count'] = this.clientCurrentCount;
    data['title_mix'] = this.titleMix;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
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

class Sensitive {
  Null? ar;

  Sensitive({this.ar});

  Sensitive.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    return data;
  }
}

class LastImage {
  int? id;
  String? image;

  LastImage({this.id, this.image});

  LastImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Pivot {
  int? branchId;
  int? productId;
  int? adminId;
  int? isActive;
  String? busyAt;
  String? busyHours;

  Pivot(
      {this.branchId,
        this.productId,
        this.adminId,
        this.isActive,
        this.busyAt,
        this.busyHours});

  Pivot.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    productId = json['product_id'];
    adminId = json['admin_id'];
    isActive = json['is_active'];
    busyAt = json['busy_at'];
    busyHours = json['busy_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch_id'] = this.branchId;
    data['product_id'] = this.productId;
    data['admin_id'] = this.adminId;
    data['is_active'] = this.isActive;
    data['busy_at'] = this.busyAt;
    data['busy_hours'] = this.busyHours;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class Images {
  int? id ;
  String? image ;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}