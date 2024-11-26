public interface ILocations extends fflib_ISObjects{
    //This class is the interface for the Location Domain.
    //Methods defined in here will determine which functionalities the Location Domain can have.
    List<Location__c> getLocations();
    void updateLastVisited();
}