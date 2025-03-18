public with sharing class PlacesService {
    
    /*
        Services:
        - retrieveYelpLink
        - generateDescription
        - calculateLastReviewDate
    */

    public static String retrieveYelpLink(String PlaceId){
        //TODO: Implement this
        return null;
    }

    public static String generateDescription(String PlaceId){
        //TODO: Implement this
        return null;
    }

    public static void updateLastReviewDate(Set<Id> PlaceIds){
        service().updateLastReviewDate(PlaceIds);
    }

    private static IPlacesService service(){
        return (IPlacesService)Application.Service.newInstance(IPlacesService.class);
    }
}