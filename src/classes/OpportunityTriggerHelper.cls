public without sharing class OpportunityTriggerHelper {
    @future(Callout=true)
    public static void updateConvertedAmount(Set<Id> opportunityIds){
        Double exchangeRate = CurrencyExchangeService.getExchangeRate();

        List<Opportunity> opportunities = [SELECT Amount, Converted_Amount__c FROM Opportunity WHERE Id IN :opportunityIds];

        for(Opportunity opportunity : opportunities){
            opportunity.Converted_Amount__c = opportunity.Amount * exchangeRate;
        }

        update opportunities;
    }
}