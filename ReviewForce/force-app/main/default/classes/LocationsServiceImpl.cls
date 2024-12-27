public with sharing class LocationsServiceImpl implements ILocationsService {
    public void updateLastReviewDate(Set<Id> locationIds){
        updateLastReivewDate(LocationsSelector.newInstance().selectByIdWithReviews(locationIds));
    }
    
    public void updateLastReviewDate(ILocations locationsWithReviews){
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        Map<Id, Date> lastReviewDateByLocationId = LocationsSelector.newInstance().selectNewestReviewDateByLocationId(locationIds);
        
        locationsWithReviews.updateLastReviewDate(lastReviewDateByLocationId, uow);

        uow.commitWork();
    }
}