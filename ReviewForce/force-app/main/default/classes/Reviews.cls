/*
    This is the domain for the review object, all record updates that are for the review object should be done in here.
*/
public with sharing class Reviews extends fflib_SObjectDomain implements IReviews {
    //#region Constructors
    //Returns a new instance of the Reviews domain
    public static IReviews newInstance(List<Review__c> recordList){
        return (IReviews) Application.Domain.newInstance(recordList);
    }
    public static IReviews newInstance(Set<Id> recordIdSet){
        return (IReviews) Application.Domain.newInstance(recordIdSet);
    }
    public Reviews(List<Review__c> sObjectList){
        super(sObjectList, Schema.Review__c.SObjectType);
    }
    public List<Review__c> getReviews(){
        return (List<Review__c>) getRecords(); //This is a method from the fflib_SObjectDomain
    }
    public class Constructor implements fflib_IDomainConstructor {
        public fflib_SObjectDomain construct(List<SObject> objectsList){
            return new Reviews((List<SObject>) objectsList);
        }
    }
    //#endregion

    //#region Public Methods
    public void doSomething(){
        //Do something
        for(Review__c review : getReviews()){
            //Do something with the review
            review.fieldName = somethingTBD;
        }
    }

    public Set<Id> getLocationIds(){
        //Retrieve the location ids from the reviews (grab from the lookup field, so no query necessary)
        Set<Id> result = new Set<Id>();
        for(Review__c review : (List<Review__c>) getRecords()){
            if(review.Location__c != null){
                result.add(review.Location__c);
            }
        }
        return result;
    }
    //#endregion

    //#region Private Methods
    //Right here would usually go utility methods, but we aren't doing anything here yet
    //#endregion


}
