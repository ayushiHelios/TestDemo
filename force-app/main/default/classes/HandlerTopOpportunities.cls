public with sharing class HandlerTopOpportunities implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session, String fileName, String fileContent) {
        Integer qty = Integer.valueof(params[0]);
        List<Opportunity> opportunities = 
            [SELECT Id, Name, Amount, Probability, StageName, CloseDate FROM Opportunity where isClosed=false ORDER BY amount DESC LIMIT :qty];
     /*   System.debug('@@SA:[Opp]:'+opportunities);*/
        List<BotRecord> records = new List<BotRecord>();
        
        for (Opportunity o : opportunities) {
            List<BotField> fields = new List<BotField>();
            fields.add(new BotField('Name', o.Name, '#/sObject/' + o.Id + '/view'));
            fields.add(new BotField('Amount', '$' + o.Amount));
            fields.add(new BotField('Probability', '' + o.Probability + '%'));
            fields.add(new BotField('Stage', o.StageName));
          /*  System.debug('@@SA:[Fields]:'+ fields);*/
            records.add(new BotRecord(fields));
         /*   System.debug('@@SA:[records]:'+fields);*/
            
        }
                        
                    return new BotResponse(new BotMessage('Bot', 'Here are your top ' + params[0] + ' opportunities:', records));
 
    }
    
}