/*
    This is the service for the location object. When trying to interact with the location serivce, we should be going through this interface
*/
public interface ILocationsService {
    void updateLastReviewDate(Set<Id> locationIds);
}