public class Application{

    //Unit Of Work Factory
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
