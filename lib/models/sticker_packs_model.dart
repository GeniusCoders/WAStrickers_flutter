class StickerPackModel {
  List<StickerPacksList> stickerPacks;

  StickerPackModel({this.stickerPacks});

  StickerPackModel.fromJson(Map<String, dynamic> json) {
    if (json['sticker_packs'] != null) {
      stickerPacks = List<StickerPacksList>();
      json['sticker_packs'].forEach((v) {
        stickerPacks.add(StickerPacksList.fromJson(v));
      });
    }
  }
}

class StickerPacksList {
  String identifier;
  String name;
  String publisher;
  String trayImageFile;
  String publisherEmail;
  String publisherWebsite;
  String privacyPolicyWebsite;
  String licenseAgreementWebsite;
  List<Stickers> stickers;

  StickerPacksList(
      {this.identifier,
      this.name,
      this.publisher,
      this.trayImageFile,
      this.publisherEmail,
      this.publisherWebsite,
      this.privacyPolicyWebsite,
      this.licenseAgreementWebsite,
      this.stickers});

  StickerPacksList.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    name = json['name'];
    publisher = json['publisher'];
    trayImageFile = json['tray_image_file'];
    publisherEmail = json['publisher_email'];
    publisherWebsite = json['publisher_website'];
    privacyPolicyWebsite = json['privacy_policy_website'];
    licenseAgreementWebsite = json['license_agreement_website'];
    if (json['stickers'] != null) {
      stickers = new List<Stickers>();
      json['stickers'].forEach((v) {
        stickers.add(new Stickers.fromJson(v));
      });
    }
  }
}

class Stickers {
  String imageFile;
  List<String> emojis;

  Stickers({this.imageFile, this.emojis});

  Stickers.fromJson(Map<String, dynamic> json) {
    imageFile = json['image_file'];
    emojis = json['emojis'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_file'] = this.imageFile;
    data['emojis'] = this.emojis;
    return data;
  }
}
