public interface IPlaces extends fflib_ISObjects{
    List<Place__c> getPlaces();
    void updateLastReviewDate(Map<Id, Date> lastReviewDateByPlaceId, fflib_ISObjectUnitOfWork uow);
}