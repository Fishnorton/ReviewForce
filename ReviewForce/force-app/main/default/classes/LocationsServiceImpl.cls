public with sharing class LocationsServiceImpl {
    
    //#region Yelp
    public String retrieveYelpLink(String locationId){
        //TODO: Implement this
        //Use Yelp API to retrieve the link
        return null;
    }
    //#endregion
    
    //#region Location Utils
    public String generateDescription(String locationId){
        //TODO: Implement this
        //Use AI to generate this.
        return null;
    }

    public void updateLastReviewDate(Set<Id> locationIds){
        
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        
        //TODO: Change this to use the selector
        List<Location__c> locations = [SELECT Id, Last_Review_Date__c FROM Location__c WHERE Id IN :locationIds];
        //TODO: Change this to use the selecotr
        Map<Id, Review__c> mostRecentReviewByLocationId = retrieveMostRecentReviewByLocationId(locationIds);
        
        //TODO: Alternatively, we could use somethign that allows us to query locationsWithReviews

        ILocations locations = (ILocations)Application.Domain.newInstance(locationIds);
        locations.updateLastReviewDate();

        uow.commitWork();
    }

    
    //#endregion
}