trigger No_of_contacts on Contact (After insert, After Update, After Delete, After Undelete) {
    set<id> accid = New set<id>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        for(Contact c:trigger.new){
            accid.add(c.AccountID);
        }
    }
    
    if(trigger.isDelete || trigger.isUpdate){
        for(Contact c:trigger.old){
            accid.add(c.AccountID);
        }
        
    }
    
    list<Account> acc = [Select id,No_of_contact__c,(Select AccountID from contacts) from Account where id in: accid];
    list<Account> update_acc = new list<Account>();
    for(Account a : acc){
        
        a.No_of_contact__c = a.contacts.size();
        update_acc.add(a);
    }
    try{
        UPDATE update_acc;
    }
    catch(Exception e){
        System.debug('Exception Error :'+e.getMessage());
    }
}