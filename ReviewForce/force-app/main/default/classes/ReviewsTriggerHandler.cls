public class ReviewsTriggerHandler extends fflib_SObjectDomain {
    public ReviewsTriggerHandler(List<Review__c> sObjectList){
        super(sObjectList);
    }

    public override void onAfterInsert(){
        
        updateLastReviewDateOnPlace(this.records);
    }

    public override void onAfterUpdate(){
        //Do nothing
    }

    public override void onAfterDelete(){
        updateLastReviewDateOnPlace(this.records);
    }

    public override void onAfterUndelete(){
        updateLastReviewDateOnPlace(this.records);
    }

    private void updateLastReviewDateOnPlace(List<Review__c> reviews){
        Set<Id> PlaceIds = Reviews.newInstance(reviews).getPlaceIds();

        PlacesService.updateLastReviewDate(PlaceIds);
    }


    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjects construct(List<SObject> sObjectList){
            return new ReviewsTriggerHandler((List<Review__c>) sObjectList);
        }
    }
}