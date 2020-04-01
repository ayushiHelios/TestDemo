@isTest
public class AddPrimaryContactTest {
    static testMethod void test(){
        List<Account>  a= new List<Account>();
        for(integer i=0;i<50;i++){
                       a.add(new Account(Name='John',BillingState='NY'));
        }
        for(integer j=0;j<50;j++){
               a.add(new Account(Name='Harry',BillingState='CA'));
        }
        insert a;
    
    
        Contact con=new Contact(LastName='Carl');
        AddPrimaryContact ap=new AddPrimaryContact(con,'CA');
        Test.startTest();
        System.enqueuejob(ap);
        Test.stopTest();
        System.assertEquals(50,[select count() from contact where accountid in(select id from account where BillingState='CA')]);
       
        
    }

}