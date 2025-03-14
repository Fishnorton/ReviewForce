public with sharing class Locations extends fflib_SObjects implements ILocations {

    public static ILocations newInstance(Set<Id> locationIds){
        return (ILocations) Application.Domain.newInstance(locationIds);
    }

    public static ILocations newInstance(List<Location__c> locations){
        return (ILocations) Application.Domain.newInstance(locations);
    }

    public Locations(List<Location__c> sObjectList) {
        super(sObjectList, Schema.Locations__c.SObjectType);
    }

    public List<Location__c> getLocations(){
        return (List<Location__c>) getRecords();
    }

    public void updateLastReviewDate(){
        //Runs the logic to get the last review date from the reviews
        for(Location__c location : getLocations()){
            location.Last_Review_Date__c = date.temp;
        }
    }

    public class Constructor implements fflib_IDomainConstructor {
        
        public fflib_SObjects construct(List<SObject> sObjectList){
            return new Locations((List<Location__c>) sObjectList);
        }
    }
}