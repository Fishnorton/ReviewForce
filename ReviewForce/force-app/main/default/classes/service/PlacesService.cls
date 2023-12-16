public with sharing class PlacesService {
    //This sample method will preform some action on the Place object.
    //This is based on the example from fflib-apex-common-samplecode where they creat a method that updates the opportunity activity field on the account object
    public static void sampleMethod(Set<Id> placeIds){
        service().sampleMethod(placeIds);
    }

    private static IPlacesService service(){
        //This returns a new implementation of the Places Service of the type IPlacesService(the interface)
        //Application.Service is a call to the Service factory, where Services can be dynamically generated
        return (IPlacesService) Application.Service.newInstance(IPlacesService.class);
    }
}