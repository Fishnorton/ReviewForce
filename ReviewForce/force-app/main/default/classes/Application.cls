public class Application{

    //Unit Of Work Factory
    /*
        When creating a unit of work, we call it via the Application class.
        Example: fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        The objects in this show the object higherarchy. Which is important to know which orders the objects should be created in.
        For example, if we are creating a review & location in the same transaction(unit of work), we need to create the location first.
        uow.registerNew(objectName) - used when creating a new object
        uow.registerNew(childSObject, childObjectName.lookupFieldName, parentSObject) - used when creating two new sObjects that have a lookup (create the parent then child and pair them up)
        uow.registerRelationship(childSObject, childObjectName.lookupFieldName, parentSObject) - used when creating a new child object that has a lookup to a parent object (the parent object ALREADY exists)
        uow.registerDirty(objectName) - used when updating an object
        uow.registerDeleted(objectName) - used when deleting an object
        uow.registerUpsert(objectName) - used when upserting an object
        uow.commitWork() - used to commit the unit of work (this is where the actual DML is executed)
    */
    public static final fflib_Application.UnitOfWorkFactory UnitOfWork = new fflib_Application.UnitOfWorkFactory(
        new List<SObjectType>{
            Location__c.SObjectType,
            Review__c.SObjectType
        }
    );

    //Service Factory
    public static final fflib_Application.ServiceFactory Service = new fflib_Application.ServiceFactory(
        new Map<Type, Type>{
            ILocationsService.class => LocationsServiceImpl.class,
            IReviewsService.class => ReviewsServiceImpl.class
        }
    );

    //Selector Factory
    public static final fflib_Application.SelectorFactory Selector = new fflib_Application.SelectorFactory(
        new Map<SObjectType, Type>{
            Location__c.SObjectType => LocationsSelector.class,
            Review__c.SObjectType => ReviewsSelector.class
        }
    );

    //Domain Factory
    public static final fflib_Application.DomainFactory Domain = new fflib_Application.DomainFactory(
        Application.Selector,
        new Map<SObjectType, Type>{
            Location__c.SObjectType => LocationsDomain.class,
            Review__c.SObjectType => ReviewsDomain.class
        }
    );
}
