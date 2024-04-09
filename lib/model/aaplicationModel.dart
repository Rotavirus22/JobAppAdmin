class ApplicationModel {
  String? status;
  List<Data>? data;

  ApplicationModel({this.status, this.data});

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? jobId;
  String? expectedSalary;
  String? coverLetter;
  String? pdfUrl;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.userId,
      this.jobId,
      this.expectedSalary,
      this.coverLetter,
      this.pdfUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    jobId = json['job_id'];
    expectedSalary = json['expected_salary'];
    coverLetter = json['cover_letter'];
    pdfUrl = json['pdf_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['job_id'] = this.jobId;
    data['expected_salary'] = this.expectedSalary;
    data['cover_letter'] = this.coverLetter;
    data['pdf_url'] = this.pdfUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
