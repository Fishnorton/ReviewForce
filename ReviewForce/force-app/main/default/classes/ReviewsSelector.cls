public with sharing class ReviewsSelector extends fflib_SObjectSelector {
    
    public ReviewsSelector() {
        super();
    }
    
    public Schema.SObjectType getSObjectType() {
        return Review__c.SObjectType;
    }
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Review__c.Id,
            Review__c.Location__c,
            Review__c.Review_Date__c
        };
    }
    
    public Date getLastReviewDateByLocation(Id locationId) {
        fflib_QueryFactory query = newQueryFactory();
        
        query.setCondition('Location__c = :locationId')
             .addOrdering('Review_Date__c', fflib_QueryFactory.SortOrder.DESCENDING)
             .setLimit(1);
             
        List<Review__c> reviews = Database.query(query.toSOQL());
        return !reviews.isEmpty() ? reviews[0].Review_Date__c : null;
    }
    
    public Map<Id, Date> getLastReviewDatesByLocation(Set<Id> locationIds) {
        fflib_QueryFactory query = newQueryFactory();
        
        query.setCondition('Location__c IN :locationIds')
             .selectField('Location__c')
             .selectField('Review_Date__c')
             .addOrdering('Location__c', fflib_QueryFactory.SortOrder.ASCENDING)
             .addOrdering('Review_Date__c', fflib_QueryFactory.SortOrder.DESCENDING);
             
        List<Review__c> reviews = Database.query(query.toSOQL());
        
        // Process results to get latest date per location
        Map<Id, Date> locationToLastReviewDate = new Map<Id, Date>();
        for(Review__c review : reviews) {
            if(!locationToLastReviewDate.containsKey(review.Location__c)) {
                locationToLastReviewDate.put(review.Location__c, review.Review_Date__c);
            }
        }
        
        return locationToLastReviewDate;
    }
} 