@istest
public class DailyLeadProcessorTest {
      public static string s='0 0 0 15 3 ? 2018';
    static testMethod void test(){
        
    List<lead> l=new List<lead>();
   
       Lead leads=new lead();
        leads.leadsource='Dreamforce';
        leads.lastname='asd';
        leads.Company='asdfg';
        l.add(leads);
    
        insert l;
         Test.startTest();
       
        String jobId=System.schedule('BasicSchedule',s,new DailyLeadProcessor());
        Test.stopTest();
       
    
    } 

}