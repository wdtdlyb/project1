public with sharing class CurrencyExchangeService {
    public static Double getExchangeRate() {
        HttpRequest req = new HttpRequest();

        Http http = new Http();
        req.setEndpoint('callout:Currency_API/live?source=' + Constants.USD_CURRENCY + '&currencies=' + Constants.EUR_CURRENCY);
        req.setMethod('GET');
        HttpResponse res = http.send(req);

        ResponseWrapper wrapper = ResponseWrapper.parse(res.getBody());

        return wrapper.quotes.USDEUR;
    }
}