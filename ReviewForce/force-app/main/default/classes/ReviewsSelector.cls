public class ReviewsSelector extends fflib_SObjectSelector implements IReviewsSelector {
    public static IReviewsSelector newInstance(){
        return (IReviewsSelector) Application.Selector.newInstance(Review__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList(){
        //TODO: Add more
        return new List<Schema.SObjectField> {
            Review__c.Id,
            Review__c.CreatedDate
        };
    }

    public Schema.SObjectType getSObjectType(){
        return Location__c.SObjectType;
    }

    public List<Location__c> selectById(Set<Id> idSet){
        return (List<Review__c>) selectSObjectsById(idSet);
    }
}