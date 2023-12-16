public with sharing class PlacesServiceImpl implements IPlacesService {
    public void sampleMethod(Set<Id> placeIds){
        /*Here we create a new instance of the unit of work
        form there, we define a new instance of the Place domain
        using the place domain, we run a sample method, which modifies the Place record (in memory, not in the database)
        from there, we call registerDirty from the unit of work, which places those "in memory" Place records into the unit of work
        from there, we can still modify the records, so if we call another class that modifies the place record, we still have
        the most recent changes.
        In this instance, we have no additional changes that we need to make to the Place record, so we commit the unit of work (which contains the place records)
        the commitWork method then pushes the changes to the database

        The purpose of the unit of work here is so that we can make a bunch of different changes when going through a business process and only modify the records once
        the business process is complete

        The reason why use the domain layer here, is because we want to make record changes in one specific place
        */
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        IPlaces places = (IPlaces) Application.Domain.newInstance(placeIds);

        places.sampleMethod();

        uow.registerDirty(places.getRecords());
        uow.commitWork();
    }
}