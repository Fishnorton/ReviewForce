public interface IPlacesSelector extends fflib_ISobjectSelector {
    List<Place__c> selectById(Set<Id> idSet);
    List<Place__c> selectByReview(List<Review__c> reviews);
}