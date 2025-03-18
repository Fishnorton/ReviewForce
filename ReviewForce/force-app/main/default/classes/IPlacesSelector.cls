public interface IPlacesSelector extends fflib_ISObjectSelector{
    List<Place__c> selectById(Set<Id> PlaceIds);
}