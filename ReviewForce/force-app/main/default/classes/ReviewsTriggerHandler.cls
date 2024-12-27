public class ReviewsTriggerHandler extends fflib_SObjectDomain {
    public ReviewsTriggerHandler(List<Review__c> sObjectList){
        super(sObjectList);
    }

    public override void onApplyDefaults(){
        //Do nothing atm
    }

    public override void onValidate(){
        //Do nothing atm
    }

    public override void onValidate(Map<Id, SObject> existingRecords){
        //Do nothing atm
    }

    public override void onAfterInsert(){
        updateLastReviewDateOnLocation();
    }

    private void updateLastReviewDateOnLocation(){
        
        //Create a new instance of the reviews domain. Pass the records in and get the location Ids (it retrieved them form the lookup field)
        Set<Id> locationIds = Reviews.newInstance(this.records).getLocationIds();

        //If there are no location ids on the reviews, exit
        if(locationIds.isEmpty()){ return;}

        LocationsService.updateLastReviewDate(locationsIds);
    }
}