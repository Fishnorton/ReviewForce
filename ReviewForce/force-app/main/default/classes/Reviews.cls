public class Reviews extends fflib_SObjects implements IReviews{

    public static IReviews newInstance(List<Review__c> records){
        return (IReviews) Application.Domain.newInstance(records);
    }

    public static IReviews newInstance(Set<Id> recordIds){
        return (IReviews) Application.Domain.newInstance(recordIds);
    }

    

    public Set<Id> getPlaceIds(){
        Set<Id> PlaceIds = new Set<Id>();
        for(Review__c review : (List<Review__c>) getRecords()){
            PlaceIds.add(review.Place__c);
        }
        return PlaceIds;
    }
}