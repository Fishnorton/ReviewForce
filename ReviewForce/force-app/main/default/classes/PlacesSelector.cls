public class PlacesSelector extends fflib_SObjectSelector implements IPlacesSelector {
    public static IPlacesSelector newInstance(){
        return (IPlacesSelector) Application.Selector.newInstance(Place__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Place__c.Id,
            Place__c.Last_Review_Date__c
        };
    }

    public Schema.SObjectType getSObjectType(){
        return Place__c.SObjectType;
    }

    public List<Place__c> selectById(Set<Id> PlaceIds){
        return (List<Place__c>) selectSObjectsById(PlaceIds);
    }

    public Map<Id, Date> selectLastReviewDateByPlaceId(Set<Id> PlaceIds){
        Map<Id, Date> lastReviewDateByPlaceId = new Map<Id, Date>();
        
        for(AggregateResult result : [
            SELECT Place__c, MAX(CreatedDate) latestReviewDate
            FROM Review__c
            WHERE Place__c IN :PlaceIds
            GROUP BY Place__c
        ]){
            Id PlaceId = (Id)result.get('Place__c');
            Date latestReviewDate = (Date)result.get('latestReviewDate');
            lastReviewDateByPlaceId.put(PlaceId, latestReviewDate);
        }
        
        return lastReviewDateByPlaceId;
    }
}