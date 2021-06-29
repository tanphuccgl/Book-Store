

class ProfileData {
  String sId;
  String email;
  String address;
  String phoneNumber;
  String dateBirth;
  String name;
  String imagePerson;
  int sex;
  List<ProductData> cart;
  List<Carted> carted;
  String introduce;

  ProfileData(
      {this.sId,
        this.email,
        this.address,
        this.phoneNumber,
        this.dateBirth,
        this.name,
        this.imagePerson,
        this.sex,
        this.cart,
        this.carted,
        this.introduce});

  ProfileData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    dateBirth = json['dateBirth'];
    name = json['name'];
    imagePerson = json['imagePerson'];
    sex = json['sex'];
    if (json['cart'] != null) {
      cart = new List<ProductData>();
      json['cart'].forEach((v) {
        cart.add(new ProductData.fromJson(v));
      });
    }
    if (json['carted'] != null) {
      carted = new List<Carted>();
      json['carted'].forEach((v) {
        carted.add(new Carted.fromJson(v));
      });
    }
    introduce = json['introduce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['dateBirth'] = this.dateBirth;
    data['name'] = this.name;
    data['imagePerson'] = this.imagePerson;
    data['sex'] = this.sex;
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
    }
    if (this.carted != null) {
      data['carted'] = this.carted.map((v) => v.toJson()).toList();
    }
    data['introduce'] = this.introduce;
    return data;
  }
}

class ProductData {
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

  ProductData(
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
        this.amount});

  ProductData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Carted {
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

  Carted(
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

  Carted.fromJson(Map<String, dynamic> json) {
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
