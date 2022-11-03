class HistoricalDataModel {
  Pagination? pagination;
  List<Data>? data;

  HistoricalDataModel({this.pagination, this.data});

  HistoricalDataModel.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  num? limit;
  num? offset;
  num? count;
  num? total;

  Pagination({this.limit, this.offset, this.count, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['offset'] = offset;
    data['count'] = count;
    data['total'] = total;
    return data;
  }
}

class Data {
  num? open;
  num? high;
  num? low;
  num? close;
  num? volume;
  num? adjHigh;
  num? adjLow;
  num? adjClose;
  num? adjOpen;
  num? adjVolume;
  num? splitFactor;
  num? dividend;
  String? symbol;
  String? exchange;
  String? date;

  Data(
      {this.open,
      this.high,
      this.low,
      this.close,
      this.volume,
      this.adjHigh,
      this.adjLow,
      this.adjClose,
      this.adjOpen,
      this.adjVolume,
      this.splitFactor,
      this.dividend,
      this.symbol,
      this.exchange,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    adjHigh = json['adj_high'];
    adjLow = json['adj_low'];
    adjClose = json['adj_close'];
    adjOpen = json['adj_open'];
    adjVolume = json['adj_volume'];
    splitFactor = json['split_factor'];
    dividend = json['dividend'];
    symbol = json['symbol'];
    exchange = json['exchange'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    data['adj_high'] = adjHigh;
    data['adj_low'] = adjLow;
    data['adj_close'] = adjClose;
    data['adj_open'] = adjOpen;
    data['adj_volume'] = adjVolume;
    data['split_factor'] = splitFactor;
    data['dividend'] = dividend;
    data['symbol'] = symbol;
    data['exchange'] = exchange;
    data['date'] = date;
    return data;
  }
}
