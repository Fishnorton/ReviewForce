public with sharing class ReviewsServiceImpl implements IReviewsService {
    public void doSomething(Set<Id> reviewIds){
        
        //Create a new instance of the unit of work. We are using the one from the application class because it has the objects defined in the order we need
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();

        //Create a new instance of the domain (go through the interface)
        IReviews reviews = (IReviews) Application.Domain.newInstance(reviewIds);

        //Calls the doSomething method from the domain
        reviews.doSomething();

        //Register the changed records with the unit of work
        uow.registerDirty(reviews.getReviews()); //TODO: Unsure on why the samplecode uses getRecords instead of getLocations, investigate this further
        
        //Perform the DML
        uow.commitWork();
    }
}