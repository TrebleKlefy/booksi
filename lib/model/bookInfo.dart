// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

 
BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));


String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
    BookModel({
       
        this.items,
    });

    
    List<Item> items;

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
    
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.kind,
    
        this.volumeInfo,
     
    });

    String kind;
    VolumeInfo volumeInfo;
    

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
       
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
      
    };
}

class AccessInfo {
    AccessInfo({
        this.country,
        this.viewability,
        this.embeddable,
        this.publicDomain,
        this.textToSpeechPermission,
        this.epub,
        this.pdf,
        this.webReaderLink,
        this.accessViewStatus,
        this.quoteSharingAllowed,
    });

    String country;
    String viewability;
    bool embeddable;
    bool publicDomain;
    String textToSpeechPermission;
    Epub epub;
    Epub pdf;
    String webReaderLink;
    String accessViewStatus;
    bool quoteSharingAllowed;

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}

class Epub {
    Epub({
        this.isAvailable,
    });

    bool isAvailable;

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
    };
}

class SaleInfo {
    SaleInfo({
        this.country,
        this.saleability,
        this.isEbook,
    });

    String country;
    String saleability;
    bool isEbook;

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
    };
}

class SearchInfo {
    SearchInfo({
        this.textSnippet,
    });

    String textSnippet;

    factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
    );

    Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
    };
}

class VolumeInfo {
    VolumeInfo({
        this.title,
        this.subtitle,
        this.authors,
        this.publisher,
        this.publishedDate,
        this.description,
        this.industryIdentifiers,
        this.readingModes,
        this.pageCount,
        this.printType,
        this.categories,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink,
    });

    String title;
    String subtitle;
    List<String> authors;
    String publisher;
    String publishedDate;
    String description;
    List<IndustryIdentifier> industryIdentifiers;
    ReadingModes readingModes;
    int pageCount;
    String printType;
    List<String> categories;
    String maturityRating;
    bool allowAnonLogging;
    String contentVersion;
    PanelizationSummary panelizationSummary;
    ImageLinks imageLinks;
    String language;
    String previewLink;
    String infoLink;
    String canonicalVolumeLink;

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"] ,
        subtitle: json["subtitle"] ,
        authors: List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        description: json["description"],
        pageCount: json["pageCount"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
    
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
       "authors": List<dynamic>.from("No author"??authors.map((x) => x )),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "imageLinks": imageLinks.toJson() ??" no image",
       
    };
}

class ImageLinks {
    ImageLinks({
        this.smallThumbnail,
        this.thumbnail,
    });

    String smallThumbnail;
    String thumbnail;

    factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"]??"No Image",
        thumbnail: json["thumbnail"]??"No Image",
    );

    Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail ??"No Image",
        "thumbnail": thumbnail??"No Image",
    };
}

class IndustryIdentifier {
    IndustryIdentifier({
        this.type,
        this.identifier,
    });

    String type;
    String identifier;

    factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
    };
}

class PanelizationSummary {
    PanelizationSummary({
        this.containsEpubBubbles,
        this.containsImageBubbles,
    });

    bool containsEpubBubbles;
    bool containsImageBubbles;

    factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
    );

    Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
    };
}

class ReadingModes {
    ReadingModes({
        this.text,
        this.image,
    });

    bool text;
    bool image;

    factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
    };
}
