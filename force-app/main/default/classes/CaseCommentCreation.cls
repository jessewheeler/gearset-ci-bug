/**
 * Created by jessewheeler on 1/3/22.
 */

public with sharing class CaseCommentCreation {

    public static Id createCaseComment(Id caseId, String comment) {
        CaseComment caseComment = new CaseComment(
                ParentId    = caseId,
                CommentBody = comment
        );
        insert caseComment;
        return caseComment.Id;
    }

}