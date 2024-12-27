/*
    This is the domain for the location object, all record updates that are for the location object should be done in here.
*/
public with sharing class Locations extends fflib_SObjectDomain implements ILocations {
    //#region Constructors
    //Returns a new instance of the locations domain
    public static ILocations newInstance(List<Location__c> recordList){
        return (ILocations) Application.Domain.newInstance(recordList);
    }
    public static ILocations newInstance(Set<Id> recordIdSet){
        return (ILocations) Application.Domain.newInstance(recordIdSet);
    }
    public Locations(List<Location__c> sObjectList){
        super(sObjectList, Schema.Location__c.SObjectType);
    }
    public List<Location__c> getLocations(){
        return (List<Location__c>) getRecords(); //This is a method from the fflib_SObjectDomain
    }
    public class Constructor implements fflib_IDomainConstructor {
        public fflib_SObjectDomain construct(List<SObject> objectsList){
            return new Locations((List<SObject>) objectsList);
        }
    }
    //#endregion

    //#region Public Methods
    public void updateLastReviewDate(Map<Id, Date> lastReviewDateByLocationId, fflib_ISObjectUnitOfWork uow){
        
        for(Location__c location : (List<Location__c>)getRecords()){
            location.Last_Review_Date__c = lastReviewDateByLocationId.get(location.Id);
            uow.registerDirty(location);
        }
    }
    //#endregion

    //#region Private Methods
    //Right here would usually go utility methods, but we aren't doing anything here yet
    //#endregion


}
