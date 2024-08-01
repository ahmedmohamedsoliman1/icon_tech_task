class AuthErrorModel {
  bool? status;
  String? msg;
  Data? data;

  AuthErrorModel({this.status, this.msg, this.data});

  AuthErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  ValidationErrors? validationErrors;

  Data({this.validationErrors});

  Data.fromJson(Map<String, dynamic> json) {
    validationErrors = json['validation_errors'] != null
        ? new ValidationErrors.fromJson(json['validation_errors'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.validationErrors != null) {
      data['validation_errors'] = this.validationErrors!.toJson();
    }
    return data;
  }
}

class ValidationErrors {
  List<String>? phone;

  ValidationErrors({this.phone});

  ValidationErrors.fromJson(Map<String, dynamic> json) {
    phone = json['phone'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}