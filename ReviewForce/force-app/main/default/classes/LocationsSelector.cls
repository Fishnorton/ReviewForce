public class LocationsSelector extends fflib_SObjectSelector implements ILocationsSelector {
    public static ILocationsSelector newInstance(){
        return (ILocationsSelector) Application.Selector.newInstance(Location__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList(){
        //TODO: Add more
        return new List<Schema.SObjectField> {
            Location__c.Id,
            Location__c.Last_Review_Date__c
        };
    }

    public Schema.SObjectType getSObjectType(){
        return Location__c.SObjectType;
    }

    public List<Location__c> selectById(Set<Id> idSet){
        return (List<Location__c>) selectSObjectsById(idSet);
    }

    public List<Location__c> selectByIdWithReviews(Set<Id> idSet){
        fflib_QueryFactory locationsQueryFactory = newQueryFactory();

        fflib_QueryFactory reviewsQueryFactory = new ReviewsSelector().addQueryFactorySubselect(locationsQueryFactory);

        return (List<Location__c>) Database.query(locationsQueryFactory.setConditions('Id IN :idSet').toSOQL());
    }

    //TODO: Determine if we should query all and filter, or if we should only query the most recent review date
    public Map<Id, Date> selectNewestReviewDateByLocationId(Set<Id> idSet){
        //TODO: Implement this
    }
}