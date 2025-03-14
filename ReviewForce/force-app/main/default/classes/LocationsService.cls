public with sharing class LocationsService {
    
    /*
        Services:
        - retrieveYelpLink
        - generateDescription
        - calculateLastReviewDate
    */

    public static String retrieveYelpLink(String locationId){
        //TODO: Implement this
        return null;
    }

    public static String generateDescription(String locationId){
        //TODO: Implement this
        return null;
    }

    public static void updateLastReviewDate(Set<Id> locationIds){
        service().updateLastReviewDate(locationIds);
    }

    private static ILocationsService service(){
        return (ILocationsService)Application.Service.newInstance(ILocationsService.class);
    }
}