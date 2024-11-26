public with sharing class Locations extends fflib_ISObjects implements ILocations{
    
    //Create a new interface with the passed in ids or records
    public static ILocations newInstance(List<Location__c> recordList){
        return (ILocations) Application.Domain.newInstance(recordList);
    }

    public static ILocations newInstance(Set<Id> recordIdSet){
        return (ILocations) Application.Domain.newInstance(recordIdSet);
    }

    //Location Constructor which accepts a list of Location__c objects
    public Locations(List<Location__c> sObjectList){
        super(sObjectList, Schema.SObjectType);
    }

    //Returns a list of locations
    public List<Location__c> getLocations(){
        return (List<Location__c>) getRecords();
    }

    public void updateLastVisited(){
        //TODO: Fix this
        for(Location__c location : getLocations()){
            location.Last_Visit_Date__c = date.today();
        }
    }

    public class Constructor implements fflib_IDomainConstructor{
		public fflib_SObjects construct(List<Object> objectList){
			return new Locations((List<SObject>) objectList);
		}
	}
}   