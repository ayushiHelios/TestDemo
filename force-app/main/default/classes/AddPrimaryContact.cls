public class AddPrimaryContact implements Queueable {
    contact con;
    string state;
    public AddPrimaryContact (contact c,string state){
        this.con=c;
        this.state=state;
        }
    public void execute(QueueableContext cx){
        List<Account> a=[Select id from Account where BillingState=:state Limit 200];
        List<Contact> c1=new List<contact>();
        for(Account acc:a){
            contact cs=con.clone();
            cs.Accountid=acc.id;
        
        c1.add(cs);
        
    }
        if(c1.size()>0)
    insert c1;
    }
}