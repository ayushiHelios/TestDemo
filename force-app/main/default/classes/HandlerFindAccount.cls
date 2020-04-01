public with sharing class HandlerFindAccount implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session, String fileName, String fileContent) {
        String key = '%' + params[0] + '%';
        
        List<Account> accounts = 
            [SELECT Id, Name, Phone FROM Account
             WHERE Name LIKE :key
             ORDER BY Name
             LIMIT 5];
        System.debug('@@A:[a]:'+accounts);
        
        List<BotRecord> records = new List<BotRecord>();
        
        for (Account a : accounts) {
            List<BotField> fields = new List<BotField>();
            fields.add(new BotField('Name', a.Name, '#/sObject/' + a.Id + '/view' ));
            fields.add(new BotField('Phone', a.Phone));
            System.debug('@@A:[f]:'+fields);
            records.add(new BotRecord(fields));
            System.debug('@@A:[r]:'+records);
        }
        return new BotResponse(new BotMessage('Bot', 'Here is a list of accounts matching "' + params[0] + '":', records));
        
    }
    
}