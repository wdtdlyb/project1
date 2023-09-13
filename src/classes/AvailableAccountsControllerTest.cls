@IsTest
private class AvailableAccountsControllerTest {
    @TestSetup
    static void loadData(){
        Account account = new Account();
        account.Name = 'testAccount';

        insert account;

        List<Contact> contacts = new List<Contact>();
        Contact contact1 = new Contact();
        contact1.LastName = 'testContact1';
        contact1.AccountId = account.Id;
        contacts.add(contact1);

        Contact contact2 = new Contact();
        contact2.LastName = 'testContact2';
        contact2.AccountId = account.Id;
        contacts.add(contact2);

        insert contacts;
    }

    @IsTest
    static void testGetAvailableAccounts() {
        Test.startTest();
        List<AvailableAccountsController.ItemWrapper> wrappers = AvailableAccountsController.getAvailableAccounts();
        Test.stopTest();

        Assert.areEqual(1, wrappers.size());
        Assert.areEqual(2, wrappers[0].items.size());
    }
}