trigger AccountTrigger on Account (after insert) {
/*ID jobID = System.enqueueJob(new SampleQueueableClass(Trigger.new));
AsyncApexJob jobInfo = [SELECT Status,NumberOfErrors FROM AsyncApexJob WHERE Id=:jobID];
    System.debug('@@status'+jobInfo.Status);*/
}