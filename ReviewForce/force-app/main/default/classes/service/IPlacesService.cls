public interface IPlacesService {
    //This provides an interface for other classes to interact with the PlacesService
    //Because we are creating an interface, we are de-coupling the class
    void sampleMethod(Set<Id> placeIds);
}