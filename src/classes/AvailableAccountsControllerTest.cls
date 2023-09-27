@IsTest
private class AvailableAccountsControllerTest {
    @TestSetup
    static void createData(){
        TestDataFactory.createContacts(2, true);
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