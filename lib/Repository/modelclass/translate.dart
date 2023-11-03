class Translate {
  Translate({
      this.data,});

  Translate.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.translations,});

  Data.fromJson(dynamic json) {
    if (json['translations'] != null) {
      translations = [];
      json['translations'].forEach((v) {
        translations?.add(Translations.fromJson(v));
      });
    }
  }
  List<Translations>? translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (translations != null) {
      map['translations'] = translations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Translations {
  Translations({
      this.translatedText,});

  Translations.fromJson(dynamic json) {
    translatedText = json['translatedText'];
  }
  String? translatedText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['translatedText'] = translatedText;
    return map;
  }

}