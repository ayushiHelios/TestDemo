public with sharing class HandlerHello implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session, String fileName, String fileContent) {
        BotMessage m=new BotMessage('Bot', 'Hi there!');
        System.debug('#Q[m]:'+m);
         Botresponse p=new BotResponse(m);
        System.debug('#Q[p]:'+p);
        return p;
    }    
    
}