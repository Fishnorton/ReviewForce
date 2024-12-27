public interface ILocationsSelector extends fflib_ISObjectSelector {
    List<Location__c> selectById(Set<Id> idSet);
    List<Location__c> selectByIdWithReviews(Set<Id> idSet);
}