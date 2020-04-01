global class SampleBatch implements Database.Batchable<sObject>, Database.AllowsCallouts{
    AsyncCalculatorServices.doSubtractResponseFuture
        stockQuoteFuture;
    public Double result {get;set;}
    public Id recId{get;set;}
    public Account acc{get;set;}
    public SampleBatch(List<Account> accList){
        recId = accList[0].id;
    }
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String Query='SELECT Id FROM Account where id=:recId';
        acc = [select id, name from Account where id=:recId];
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext info,List<Sobject> scope){
        /*Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
request.setMethod('GET');
System.debug('request: '+request);
HttpResponse response = http.send(request);
System.debug('response: '+response);
if (response.getStatusCode() == 200) {
Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
List<Object> animals = (List<Object>) results.get('animals');
for (Object animal: animals) {
System.debug(animal);
}
}*/
        Integer TIMEOUT_INT_SECS = 60;  
        Continuation cont = new Continuation(TIMEOUT_INT_SECS);
        cont.continuationMethod = 'processResponse';
        
        AsyncCalculatorServices.AsyncCalculatorImplPort 
            stockQuoteService = 
            new AsyncCalculatorServices.AsyncCalculatorImplPort();
        stockQuoteFuture = stockQuoteService.beginDoSubtract(cont,5,2);  
    }
    global void finish (Database.BatchableContext BC){}
    /*public void startRequest() {    
Integer TIMEOUT_INT_SECS = 60;  
Continuation cont = new Continuation(TIMEOUT_INT_SECS);
cont.continuationMethod = 'processResponse';

AsyncCalculatorServices.AsyncCalculatorImplPort 
stockQuoteService = 
new AsyncCalculatorServices.AsyncCalculatorImplPort();
stockQuoteFuture = stockQuoteService.beginDoSubtract(cont,5,2);     
//return cont;   
} */   
    public Object processResponse() {    
        result = stockQuoteFuture.getValue();
        acc.Name = acc.Name+result;
        update acc;
        System.debug('res: '+result);
        return null; 
    }
}