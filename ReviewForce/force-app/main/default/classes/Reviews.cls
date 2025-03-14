public class Reviews extends fflib_SObjects implements IReviews{

    public static IReviews newInstance(List<Review__c> records){
        return (IReviews) Application.Domain.newInstance(records);
    }

    public static IReviews newInstance(Set<Id> recordIds){
        return (IReviews) Application.Domain.newInstance(recordIds);
    }

    

    public Set<Id> getLocationIds(){
        Set<Id> locationIds = new Set<Id>();
        for(Review__c review : (List<Review__c>) getRecords()){
            locationIds.add(review.Location__c);
        }
        return locationIds;
    }
}