public interface IReviewsSelector extends fflib_ISObjectSelector {
    List<Review__c> selectById(Set<Id> idSet);
}