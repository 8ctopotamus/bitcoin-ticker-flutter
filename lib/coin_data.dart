import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<String> getCoinData({String currency = 'USD'}) async {
    var response = await http.get('https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$currency');
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['last'].toString();
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return 'Error: could not get data.';
    }
  }
}
