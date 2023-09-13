public with sharing class AvailableAccountsController {
    @AuraEnabled(Cacheable=true)
    public static List<ItemWrapper> getAvailableAccounts(){
        List<ItemWrapper> wrappers = new List<ItemWrapper>();

        List<Account> accountsWithContacts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];

        for(Account account : accountsWithContacts){
            List<ItemWrapper> contactWrappers = new List<ItemWrapper>();

            for(Contact contact : account.Contacts){
                ItemWrapper contactWrapper = new ItemWrapper();
                contactWrapper.name = contact.Id;
                contactWrapper.label = contact.Name;

                contactWrappers.add(contactWrapper);
            }

            ItemWrapper accountWrapper = new ItemWrapper();
            accountWrapper.name = account.Id;
            accountWrapper.label = account.Name;
            accountWrapper.items = contactWrappers;

            wrappers.add(accountWrapper);
        }

        return wrappers;
    }

    public class ItemWrapper{
        @AuraEnabled
        public String name{get;set;}
        @AuraEnabled
        public String label{get;set;}
        @AuraEnabled
        public List<ItemWrapper> items{get;set;}
    }
}