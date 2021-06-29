class ProductedData {
  String sId;
  String tenSach;
  String khoSach;
  String theLoai;
  String tacGia;
  String nxb;
  String phathanhthang;
  String loaisach;
  String isStatus;
  String urlImage;
  String giaBia;
  String amount;
  String datePayment;

  ProductedData(
      {this.sId,
        this.tenSach,
        this.khoSach,
        this.theLoai,
        this.tacGia,
        this.nxb,
        this.phathanhthang,
        this.loaisach,
        this.isStatus,
        this.urlImage,
        this.giaBia,
        this.amount,
        this.datePayment});

  ProductedData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tenSach = json['tenSach'];
    khoSach = json['khoSach'];
    theLoai = json['theLoai'];
    tacGia = json['tacGia'];
    nxb = json['nxb'];
    phathanhthang = json['phathanhthang'];
    loaisach = json['loaisach'];
    isStatus = json['isStatus'];
    urlImage = json['urlImage'];
    giaBia = json['giaBia'];
    amount = json['amount'];
    datePayment = json['datePayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tenSach'] = this.tenSach;
    data['khoSach'] = this.khoSach;
    data['theLoai'] = this.theLoai;
    data['tacGia'] = this.tacGia;
    data['nxb'] = this.nxb;
    data['phathanhthang'] = this.phathanhthang;
    data['loaisach'] = this.loaisach;
    data['isStatus'] = this.isStatus;
    data['urlImage'] = this.urlImage;
    data['giaBia'] = this.giaBia;
    data['amount'] = this.amount;
    data['datePayment'] = this.datePayment;
    return data;
  }
}