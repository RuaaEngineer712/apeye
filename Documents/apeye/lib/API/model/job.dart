// To parse this JSON data, do
//
//     final jobs = jobsFromJson(jsonString);

import 'dart:convert';

Jobs jobsFromJson(String str) => Jobs.fromJson(json.decode(str));

String jobsToJson(Jobs data) => json.encode(data.toJson());

class Jobs {
    Jobs({
        required this.kind,
        required this.url,
        required this.queries,
        required this.context,
        required this.searchInformation,
        // required this.items,
    });

    String kind;
    Url url;
    Queries queries;
    Context context;
    SearchInformation searchInformation;
    // List<Item> items;

    

    factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        kind: json["kind"],
        url: Url.fromJson(json["url"]),
        queries: Queries.fromJson(json["queries"]),
        context: Context.fromJson(json["context"]),
        searchInformation: SearchInformation.fromJson(json["searchInformation"]),
        
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "url": url.toJson(),
        "queries": queries.toJson(),
        "context": context.toJson(),
        "searchInformation": searchInformation.toJson(),
    };
}


class Context {
    Context({
        required this.title,
    });

    String title;

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
    };
}


enum DisplayLink { WWW_INDEED_COM }

final displayLinkValues = EnumValues({
    "www.indeed.com": DisplayLink.WWW_INDEED_COM
});

enum Kind { CUSTOMSEARCH_RESULT }

final kindValues = EnumValues({
    "customsearch#result": Kind.CUSTOMSEARCH_RESULT
});

class Pagemap {
    Pagemap({
        required this.metatags,
        required this.listitem,
    });

    List<Metatag> metatags;
    List<Listitem> listitem;

    factory Pagemap.fromJson(Map<String, dynamic> json) => Pagemap(
        metatags: List<Metatag>.from(json["metatags"].map((x) => Metatag.fromJson(x))),
        listitem:  List<Listitem>.from(json["listitem"].map((x) => Listitem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "metatags": List<dynamic>.from(metatags.map((x) => x.toJson())),
        "listitem": listitem == null ? null : List<dynamic>.from(listitem.map((x) => x.toJson())),
    };
}

class Listitem {
    Listitem({
        required this.position,
        required this.name,
    });

    String position;
    String name;

    factory Listitem.fromJson(Map<String, dynamic> json) => Listitem(
        position: json["position"] == null ? null : json["position"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "position": position == null ? null : position,
        "name": name == null ? null : name,
    };
}

class Metatag {
    Metatag({
        required this.ogType,
        required this.twitterCard,
        required this.twitterTitle,
        required this.ogSiteName,
        required this.viewport,
        required this.ogLocale,
        required this.ogUrl,
        required this.ogDescription,
        required this.referrer,
        required this.formatDetection,
        required this.nextHeadCount,
    });

    String ogType;
    String twitterCard;
    String twitterTitle;
    String ogSiteName;
    Viewport viewport;
    String ogLocale;
    String ogUrl;
    String ogDescription;
    String referrer;
    String formatDetection;
    String nextHeadCount;

    factory Metatag.fromJson(Map<String, dynamic> json) => Metatag(
        ogType: json["og:type"] == null ? null : json["og:type"],
        twitterCard: json["twitter:card"] == null ? null : json["twitter:card"],
        twitterTitle: json["twitter:title"] == null ? null : json["twitter:title"],
        ogSiteName: json["og:site_name"] == null ? null : json["og:site_name"],
        viewport: json["viewport"] == null ? null : json["viewport"],
        ogLocale: json["og:locale"] == null ? null : json["og:locale"],
        ogUrl: json["og:url"] == null ? null : json["og:url"],
        ogDescription: json["og:description"] == null ? null : json["og:description"],
        referrer: json["referrer"] == null ? null : json["referrer"],
        formatDetection: json["format-detection"] == null ? null : json["format-detection"],
        nextHeadCount: json["next-head-count"] == null ? null : json["next-head-count"],
    );

    Map<String, dynamic> toJson() => {
        "og:type": ogType == null ? null : ogType,
        "twitter:card": twitterCard == null ? null : twitterCard,
        "twitter:title": twitterTitle == null ? null : twitterTitle,
        "og:site_name": ogSiteName == null ? null : ogSiteName,
        // "viewport": viewportValues.reverse[viewport],
        "og:locale": ogLocale == null ? null : ogLocale,
        "og:url": ogUrl == null ? null : ogUrl,
        "og:description": ogDescription == null ? null : ogDescription,
        "referrer": referrer == null ? null : referrer,
        "format-detection": formatDetection == null ? null : formatDetection,
        "next-head-count": nextHeadCount == null ? null : nextHeadCount,
    };
}

enum Viewport { WIDTH_DEVICE_WIDTH_INITIAL_SCALE_1, WIDTH_DEVICE_WIDTH_INITIAL_SCALE_10, WIDTH_DEVICE_WIDTH }

final viewportValues = EnumValues({
    "width=device-width": Viewport.WIDTH_DEVICE_WIDTH,
    "width=device-width, initial-scale=1": Viewport.WIDTH_DEVICE_WIDTH_INITIAL_SCALE_1,
    "width=device-width,initial-scale=1.0": Viewport.WIDTH_DEVICE_WIDTH_INITIAL_SCALE_10
});

class Queries {
    Queries({
        required this.request,
        required this.nextPage,
    });

    List<NextPage> request;
    List<NextPage> nextPage;

    factory Queries.fromJson(Map<String, dynamic> json) => Queries(
        request: List<NextPage>.from(json["request"].map((x) => NextPage.fromJson(x))),
        nextPage: List<NextPage>.from(json["nextPage"].map((x) => NextPage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "request": List<dynamic>.from(request.map((x) => x.toJson())),
        "nextPage": List<dynamic>.from(nextPage.map((x) => x.toJson())),
    };
}

class NextPage {
    NextPage({
        required this.totalResults,
        required this.count,
        required this.startIndex,
        required this.inputEncoding,
        required this.outputEncoding,
        required this.safe,
        required this.cx,
        required this.filter,
        required this.cr,
        required this.siteSearch,
        required this.exactTerms,
        required this.dateRestrict,
    });

    String totalResults;
    int count;
    int startIndex;
    String inputEncoding;
    String outputEncoding;
    String safe;
    String cx;
    String filter;
    String cr;
    String siteSearch;
    String exactTerms;
    String dateRestrict;

    factory NextPage.fromJson(Map<String, dynamic> json) => NextPage(
        totalResults: json["totalResults"],
        count: json["count"],
        startIndex: json["startIndex"],
        inputEncoding: json["inputEncoding"],
        outputEncoding: json["outputEncoding"],
        safe: json["safe"],
        cx: json["cx"],
        filter: json["filter"],
        cr: json["cr"],
        siteSearch: json["siteSearch"],
        exactTerms: json["exactTerms"],
        dateRestrict: json["dateRestrict"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "count": count,
        "startIndex": startIndex,
        "inputEncoding": inputEncoding,
        "outputEncoding": outputEncoding,
        "safe": safe,
        "cx": cx,
        "filter": filter,
        "cr": cr,
        "siteSearch": siteSearch,
        "exactTerms": exactTerms,
        "dateRestrict": dateRestrict,
    };
}

class SearchInformation {
    SearchInformation({
        required this.searchTime,
        required this.formattedSearchTime,
        required this.totalResults,
        required this.formattedTotalResults,
    });

    double searchTime;
    String formattedSearchTime;
    String totalResults;
    String formattedTotalResults;

    factory SearchInformation.fromJson(Map<String, dynamic> json) => SearchInformation(
        searchTime: json["searchTime"].toDouble(),
        formattedSearchTime: json["formattedSearchTime"],
        totalResults: json["totalResults"],
        formattedTotalResults: json["formattedTotalResults"],
    );

    Map<String, dynamic> toJson() => {
        "searchTime": searchTime,
        "formattedSearchTime": formattedSearchTime,
        "totalResults": totalResults,
        "formattedTotalResults": formattedTotalResults,
    };
}

class Url {
    Url({
        required this.type,
        required this.template,
    });

    String type;
    String template;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        template: json["template"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "template": template,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    // Map<T, String> reverseMap;

    EnumValues(this.map);

    // Map<T, String> get reverse {
    //     if (reverseMap == null) {
    //         reverseMap = map.map((k, v) => new MapEntry(v, k));
    //     }
    //     return reverseMap;
    // }
}
