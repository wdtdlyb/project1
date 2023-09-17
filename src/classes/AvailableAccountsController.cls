public with sharing class AvailableAccountsController {
    @AuraEnabled(Cacheable=true)
    public static List<ItemWrapper> getAvailableAccounts(){
        List<ItemWrapper> wrappers = new List<ItemWrapper>();

        List<Account> accountsWithContacts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account LIMIT 100];

        for(Account account : accountsWithContacts){
            List<ItemWrapper> contactWrappers = new List<ItemWrapper>();

            for(Contact contact : account.Contacts){
                ItemWrapper contactWrapper = new ItemWrapper(contact.Id, contact.Name, null);
                contactWrappers.add(contactWrapper);
            }

            ItemWrapper accountWrapper = new ItemWrapper(account.Id, account.Name, contactWrappers);
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

        public ItemWrapper(String name, String label, List<ItemWrapper> items){
            this.name = name;
            this.label = label;
            this.items = items;
        }
    }
}