public with sharing class LocationsService{
    public static void updateLastVisited(Set<Id> locationIds){
        service().updateLastVisited(locationIds);
    }

    private static ILocationsService service(){
        return (ILocationsService) Application.Service.newInstance(IAccountsService.class);
    }
}