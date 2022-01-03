/**
 * Created by jessewheeler on 1/3/22.
 */

@IsTest
public class CaseCommentCreationTest {

    @TestSetup
    static void generateTestData() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(AccountId = a.Id, LastName = 'Test', Email = 'test@test.com');
        insert c;

        insert new Case(AccountId = a.Id, ContactId = c.Id, Status = 'New', Subject = 'Test Subject');
    }

    @IsTest
    static void caseCommentShouldBeCreated() {
        String commentBody = 'Test Comment';
        Id caseId    = [SELECT Id FROM Case LIMIT 1].Id;
        Id commentId = CaseCommentCreation.createCaseComment(caseId, commentBody);
        CaseComment comment = [SELECT CommentBody, ParentId FROM CaseComment WHERE Id = :commentId];
        System.assertEquals(commentBody, comment.CommentBody);
    }

}