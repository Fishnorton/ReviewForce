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
        
        ILocations locations = (ILocations) Application.Domain.newInstance(locationIds);
        Map<Id, Date> lastReviewDateByLocationId = null; //Use selector to query the dates
        locations.updateLastReviewDate(lastReviewDateByLocationId, uow);

        uow.commitWork();
    }

    
    //#endregion
}