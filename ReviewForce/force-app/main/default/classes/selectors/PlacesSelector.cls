public class PlacesSelector extends fflib_SobjectSelector implements IPlacesSelector {
    
    public static IPlacesSelector newInstance(){
        return (IPlacesSelector) Application.Selector.newInstance(Place__c.SObjectType);
    }

    public List<Schema.SObjectField> getSObjectFieldList(){
        return new List<Schema.SObjectFieldList>{
            Place__c.Id,
            Place__c.Name,
            Place__c.Description__c
        };
    }

    public Schema.SObjectType getSObjectType(){
		return Place__c.SObjectType;
	}

    public List<Place__c> selectById(Set<Id> idSet){
		return (List<Place__c>) selectSObjectsById(idSet);
	}

    public List<Place__c> selectByReview(List<Review__c> reviews){
        Set<Id> placeIds = new Set<Id>();
        for(Review__c r : (List<Review__c>) reviews){
            if(r.Place__c != null){
                placeIds.add(r.Place__c);
            }
        }
        return selectById(placeIds);
    }
}