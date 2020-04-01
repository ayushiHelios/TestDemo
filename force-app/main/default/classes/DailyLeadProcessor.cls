public class DailyLeadProcessor implements Schedulable {
     public void execute(SchedulableContext sc){
        List<Lead> l=[Select id,leadsource from lead where leadsource='' limit 200];
        
         for(lead ld:l){
            
            ld.leadsource='Dreamforce';
              update l;
        }
       
    }

}