public class TestCLI {
    @future
    public static void countContacts(List<Id> accountIds) {
        Integer numberOfContact = 0;
        Map<Id, Integer> mapNumberContactOfAccount = new Map<Id, Integer>();

        List<AggregateResult> listContact = [select count(Id)totalContact, AccountId
                                            from Contact
                                            where AccountId in :accountIds
                                            group by accountId];
        for(AggregateResult tempContact : listContact) {
            mapNumberContactOfAccount.put((Id)tempContact.get('AccountId'), (Integer)tempContact.get('totalContact'));
        }

        List<Account> listAccount = [select Id, Number_Of_Contacts__c
                                        from Account
                                        where Id in :accountIds];

        for(Account tempAccount : listAccount) {
            if(mapNumberContactOfAccount.containsKey(tempAccount.Id)) {
                tempAccount.Number_Of_Contacts__c = mapNumberContactOfAccount.get(tempAccount.Id);
            }
        }

        if(!listAccount.isEmpty()) {
            update listAccount;
        }
    }
}