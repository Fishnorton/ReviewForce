public class ReviewsTriggerHandler extends fflib_SObjectDomain {
    public ReviewsTriggerHandler(List<Review__c> sObjectList){
        super(sObjectList);
    }

    public override void onAfterInsert(){
        
        updateLastReviewDateOnLocation(this.records);
    }

    public override void onAfterUpdate(){
        //Update the last review date
        List<Review__c> reviewsWithModifiedReviewDate = (List<Review__c>) this.records.getChangedRecords(new Set<String>{'Review_Date__c'});
        if(reviewsWithModifiedReviewDate.isEmpty()){ return;}
        updateLastReviewDateOnLocation(reviewsWithModifiedReviewDate);

        //Do something else
    }

    private void updateLastReviewDateOnLocation(List<Review__c> reviews){
        Set<Id> locationIds = Reviews.newInstance(reviews).getLocationIds();

        LocationsService.updateLastReviewDate(locationIds);
    }


    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjects construct(List<SObject> sObjectList){
            return new ReviewsTriggerHandler((List<Review__c>) sObjectList);
        }
    }
}