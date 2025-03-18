public with sharing class PlacesServiceImpl implements IPlacesService {
    
    //#region Yelp
    public String retrieveYelpLink(String PlaceId){
        //TODO: Implement this
        //Use Yelp API to retrieve the link
        return null;
    }
    //#endregion
    
    //#region Place Utils
    public String generateDescription(String PlaceId){
        //TODO: Implement this
        //Use AI to generate this.
        return null;
    }

    public void updateLastReviewDate(Set<Id> PlaceIds){
        
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        
        IPlaces Places = (IPlaces) Application.Domain.newInstance(PlaceIds);
        Map<Id, Date> lastReviewDateByPlaceId = PlacesSelector.newInstance().selectLastReviewDateByPlaceId(PlaceIds);
        Places.updateLastReviewDate(lastReviewDateByPlaceId, uow);

        uow.commitWork();
    }

    
    //#endregion
}