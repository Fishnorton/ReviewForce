public with sharing class Places extends fflib_SObjects implements IPlaces {
    
    public static IPlaces newIntance(List<Place__c> recordList){
        return (IPlaces) Application.Domain.newInstance(recordList);
    }

    public static IPlaces newInstance(Set<Id> recordIdSet){
        return (IPlaces) Application.Domain.newInstance(recordIdSet);
    }

    public Places(List<Place__c> sObjectList){
        super(sObjectList, Schema.Place.SObjectType);
    }

    public List<Place__c> getPlaces(){
        return (List<Place__c>) getRecords();
    }

    public void setDescription(String desciption){
        for(Place__c place : getPlaces()){
            place.Description__c = 'Description';
        }
    }

    public void sampleMethod(){
        //some sample method call (that we define in this class) goes here
    }

    public class Constructor implements fflib_IDomainConstructor{
        public fflib_SObjects construct(List<Object> objectList){
            return new Place__c((List<SObject>) objectList);
        }
    }
}