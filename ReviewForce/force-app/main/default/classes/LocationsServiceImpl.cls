public with sharing class LocationsServiceImpl implements ILocationsService{

    public void updateLastVisited(Set<Id> locationIds){
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        ILocations locations = (ILocations) Application.Domain.newInstance(locationIds);

        locations.updateLastVisited();

        uow.registerDirty(locations.getRecords());
        uow.commitWork();
    }  
}