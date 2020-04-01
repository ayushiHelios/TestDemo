public class ContinuationSOAPController {
    
    AsyncCalculatorServices.doSubtractResponseFuture
        stockQuoteFuture;
    public Double result {get;set;}
    public Continuation startRequest() {    
        Integer TIMEOUT_INT_SECS = 60;  
        Continuation cont = new Continuation(TIMEOUT_INT_SECS);
        cont.continuationMethod = 'processResponse';
        
        AsyncCalculatorServices.AsyncCalculatorImplPort 
            stockQuoteService = 
            new AsyncCalculatorServices.AsyncCalculatorImplPort();
        stockQuoteFuture = stockQuoteService.beginDoSubtract(cont,5,2);   
        //System.debug('cont: '+cont+'@@@@'+stockQuoteFuture.getValue());
        
        return cont;   
    }    
    
    public Object processResponse() {    
        result = stockQuoteFuture.getValue();
        System.debug('res: '+result);
         System.debug('@@response'+Continuation.getResponse('Continuation-1'));
        return null; 
    }
}