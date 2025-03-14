public interface ILocations extends fflib_ISObjects{
    List<Location__c> getLocations();
    void updateLastReviewDate();
}