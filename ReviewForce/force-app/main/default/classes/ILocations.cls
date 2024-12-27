public interface ILocations {
    List<Location__c> getLocations();
    void updateLastReviewDate(Map<Id, Date> lastReviewDateByLocationId, fflib_ISObjectUnitOfWork uow);
}