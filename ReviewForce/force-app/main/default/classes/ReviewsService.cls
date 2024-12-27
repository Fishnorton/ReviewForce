public with sharing class ReviewsService {
    public static void doSomething(Set<Id> reviewIds){
        service().doSomething(reviewIds);
    }

    private static IReviewsService service(){
        return (IReviewsService) Application.Service.newInstance(IReviewsService.class);
    }
}