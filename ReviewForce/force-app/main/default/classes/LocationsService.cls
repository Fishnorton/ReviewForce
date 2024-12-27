public with sharing class LocationsService {
    public static void updateLastReviewDate(Set<Id> locationIds){
        service().updateLastReviewDate(locationIds);
    }

    private static ILocationsService service(){
        return (ILocationsService) Application.Service.newInstance(ILocationsService.class);
    }
}