@isTest
private class AccountRestControllerTest {
    @isTest
    static void testCreateAccount() {
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        request.requestUri ='/services/apexrest/createAccount';
        request.httpMethod = 'POST';
        RestContext.request = request;
        RestContext.response = response;

        Test.startTest();
        Account account = AccountRestController.createAccount('testName', 'testDescription');
        Test.stopTest();

        Assert.areNotEqual(null, account.Id);
        
    }
}