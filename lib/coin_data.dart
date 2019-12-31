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
  Future<Map<String, String>> getCoinData(String selectedCurrency) async {
    Map<String, String> updatedLatestPrices = {};
    for (String crypto in cryptoList) {
      var response = await http.get('https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$selectedCurrency');
      if (response.statusCode == 200) {
        updatedLatestPrices[crypto] = jsonDecode(response.body)['last'].toString();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        updatedLatestPrices[crypto] = '😵';
        throw 'Request failed with status: ${response.statusCode}.';
      }
    }
    return updatedLatestPrices;
  }
}
