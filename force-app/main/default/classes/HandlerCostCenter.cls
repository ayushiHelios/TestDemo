public with sharing class HandlerCostCenter implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session, String fileName, String fileContent) {
        BotMessage m=new BotMessage('Bot', 'Your cost center is 21852');
        System.debug('#A[M]:'+m);
        return new BotResponse(m);
    }
    
}