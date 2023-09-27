public without sharing class OpportunityTriggerHandler implements TriggerHandler {
    private Boolean triggerIsExecuting;
    private Integer triggerSize;

    public OpportunityTriggerHandler(Boolean triggerIsExecuting, Integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
    }

    public void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<Id, SObject> oldRecordMap, Map<Id, SObject> newRecordMap) {
        OpportunityTriggerHelper.updateConvertedAmount(newRecordMap.keySet());
    }

    public void beforeInsert(List<SObject> newRecords) {
    }

    public void beforeDelete(List<SObject> oldRecords, Map<Id, SObject> oldRecordMap) {
    }

    public void afterInsert(List<SObject> newRecords, Map<Id, SObject> newRecordMap) {
    }

    public void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<Id, SObject> oldRecordMap, Map<Id, SObject> newRecordMap) {
    }

    public void afterDelete(List<SObject> oldRecords, Map<Id, SObject> oldRecordMap) {
    }

    public void afterUndelete(List<SObject> newRecords, Map<Id, SObject> newRecordMap) {
    }
}