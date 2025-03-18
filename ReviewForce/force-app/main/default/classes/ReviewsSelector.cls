public class ReviewsSelector extends fflib_SObjectSelector {
    public static IReviewsSelector newInstance(){
        return (IReviewsSelector) Application.Selector.newInstance(Review__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Review__c.Id,
            Review__c.Place__c,
            Review__c.CreatedDate
        };
    }

    public Schema.SObjectType getSObjectType(){
        return Review__c.SObjectType;
    }

    public List<Review__c> selectById(Set<Id> reviewIds){
        return (List<Review__c>) selectSObjectsById(reviewIds);
    }

    public Map
    
}