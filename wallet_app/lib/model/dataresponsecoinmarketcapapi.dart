// To parse this JSON data, do
//
//     final dataResponseCoinMarketCapApi = dataResponseCoinMarketCapApiFromJson(jsonString);

import 'dart:convert';

DataResponseCoinMarketCapApi dataResponseCoinMarketCapApiFromJson(String str) => DataResponseCoinMarketCapApi.fromJson(json.decode(str));

String dataResponseCoinMarketCapApiToJson(DataResponseCoinMarketCapApi data) => json.encode(data.toJson());

class DataResponseCoinMarketCapApi {
    DataResponseCoinMarketCapApi({
        required this.data,
    });

    List<DataCoin> data;

    factory DataResponseCoinMarketCapApi.fromJson(Map<String, dynamic> json) => DataResponseCoinMarketCapApi(
        data: List<DataCoin>.from(json["data"].map((x) => DataCoin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class DataCoin {
    DataCoin({
        required this.id,
        required this.name,
        required this.symbol,
        required this.slug,
        required this.numMarketPairs,
        required this.dateAdded,
        required this.tags,
        required this.maxSupply,
        required this.circulatingSupply,
        required this.totalSupply,
        required this.platform,
        required this.cmcRank,
        required this.selfReportedCirculatingSupply,
        required this.selfReportedMarketCap,
        required this.lastUpdated,
        required this.quote,
    });

    int id;
    String name;
    String symbol;
    String slug;
    int numMarketPairs;
    DateTime dateAdded;
    List<String> tags;
    int? maxSupply;
    int? circulatingSupply;
    int totalSupply;
    dynamic platform;
    int cmcRank;
    dynamic selfReportedCirculatingSupply;
    dynamic selfReportedMarketCap;
    DateTime lastUpdated;
    Quote quote;

    factory DataCoin.fromJson(Map<String, dynamic> json) => DataCoin(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"].toInt(),
        totalSupply: json["total_supply"].toInt(),
        platform: json["platform"],
        cmcRank: json["cmc_rank"],
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "platform": platform,
        "cmc_rank": cmcRank,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
    };
}

class Quote {
    Quote({
        required  this.cop,
    });

    Cop cop;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        cop: Cop.fromJson(json["COP"]),
    );

    Map<String, dynamic> toJson() => {
        "COP": cop.toJson(),
    };
}

class Cop {
    Cop({
        required this.price,
        required this.volume24H,
        required this.volumeChange24H,
        required this.percentChange1H,
        required this.percentChange24H,
        required this.percentChange7D,
        required this.percentChange30D,
        required this.percentChange60D,
        required this.percentChange90D,
        required this.marketCap,
        required this.marketCapDominance,
        required this.fullyDilutedMarketCap,
        required this.lastUpdated,
    });

    double price;
    double volume24H;
    double volumeChange24H;
    double percentChange1H;
    double percentChange24H;
    double percentChange7D;
    double percentChange30D;
    double percentChange60D;
    double percentChange90D;
    int? marketCap;
    double marketCapDominance;
    double fullyDilutedMarketCap;
    DateTime lastUpdated;

    factory Cop.fromJson(Map<String, dynamic> json) => Cop(
        price: json["price"].toDouble(),
        volume24H: json["volume_24h"].toDouble(),
        volumeChange24H: json["volume_change_24h"].toDouble(),
        percentChange1H: json["percent_change_1h"].toDouble(),
        percentChange24H: json["percent_change_24h"].toDouble(),
        percentChange7D: json["percent_change_7d"].toDouble(),
        percentChange30D: json["percent_change_30d"].toDouble(),
        percentChange60D: json["percent_change_60d"].toDouble(),
        percentChange90D: json["percent_change_90d"].toDouble(),
        marketCap: json["market_cap"].toInt(),
        marketCapDominance: json["market_cap_dominance"].toDouble(),
        fullyDilutedMarketCap: json["fully_diluted_market_cap"].toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "percent_change_30d": percentChange30D,
        "percent_change_60d": percentChange60D,
        "percent_change_90d": percentChange90D,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "fully_diluted_market_cap": fullyDilutedMarketCap,
        "last_updated": lastUpdated.toIso8601String(),
    };
}
