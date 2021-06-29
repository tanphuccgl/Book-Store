class ProductData {
  String sId;

  String tenSach;
  String khoSach;
  String theLoai;
  String tacGia;
  String nxb;
  String phathanhthang;
  String loaisach;
  String urlImage;
  String giaBia;
  String moTa;
  String amount;
  String yeuThich;
  String isStatus;

  ProductData(
      {this.sId,

        this.tenSach,
        this.khoSach,
        this.theLoai,
        this.tacGia,
        this.nxb,
        this.phathanhthang,
        this.loaisach,
        this.urlImage,
        this.giaBia,
        this.moTa,this.amount,this.yeuThich,this.isStatus
      });

  ProductData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];

    tenSach = json['tenSach'];
    khoSach = json['khoSach'];
    theLoai = json['theLoai'];
    tacGia = json['tacGia'];
    nxb = json['nxb'];
    phathanhthang = json['phathanhthang'];
    loaisach = json['loaisach'];
    urlImage = json['urlImage'];
    giaBia = json['giaBia'];
    moTa = json['moTa'];
    amount = json['amount'];
    yeuThich = json['yeuThich'];
    isStatus = json['isStatus'];
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
    data['urlImage'] = this.urlImage;
    data['giaBia'] = this.giaBia;
    data['moTa'] = this.moTa;
    data['amount'] = this.amount;
    data['yeuThich'] = this.yeuThich;
    data['isStatus'] = this.isStatus;
    return data;
  }
}