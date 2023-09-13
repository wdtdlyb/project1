@RestResource(urlMapping='/createAccount')
global with sharing class AccountRestController {

    @HttpPost
    global static Account createAccount(String name, String description) {
        Account newAccount = new Account();

        if(String.isNotBlank(name) && String.isNotBlank(description)){
            newAccount.Name = name;
            newAccount.Description = description;

            insert newAccount;
    }
        return newAccount;
    }
}