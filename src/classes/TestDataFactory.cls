public class TestDataFactory {
    public static List<Account> createAccounts(Integer quantity, Boolean doInsert){
        List<Account> accounts = new List<Account>();

        for(Integer i = 0; i < quantity; i++){
            Account account = new Account(Name = 'testAccount');
            accounts.add(account);
        }

        if(doInsert){
            insert accounts;
        }

        return accounts;
    }

    public static List<Contact> createContacts(Integer quantity, Boolean doInsert){
        List<Contact> contacts = new List<Contact>();

        Account account = createAccounts(1, true).get(0);

        for(Integer i = 0; i < quantity; i++){
            Contact contact = new Contact(LastName = 'testContact', AccountId = account.Id);
            contacts.add(contact);
        }

        if(doInsert){
            insert contacts;
        }

        return contacts;
    }
}