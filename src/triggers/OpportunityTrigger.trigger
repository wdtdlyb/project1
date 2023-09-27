trigger OpportunityTrigger on Opportunity (before update) {
    if(System.isFuture()){
        return;
    }

    OpportunityTriggerHandler handler = new OpportunityTriggerHandler(Trigger.isExecuting, Trigger.size);

    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
    }
}