package ac.tukorea.gradebuddy.domain.feedbacks;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FeedbackMapper {
    // Create (INSERT)
    @Insert("INSERT INTO feedbacks (user_id, submissions_id, feedback_score, feedback_comment) " +
            "VALUES (#{userId}, #{submissionsId}, #{feedbackScore}, #{feedbackComment})")
    @Options(useGeneratedKeys = true, keyProperty = "feedbackId")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "submissionsId", column = "submissions_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "feedbackScore", column = "feedback_score"),
            @Result(property = "feedbackComment", column = "feedback_comment"),
    })
    void createFeedback(Feedback feedback);

    // Read All (SELECT)
    @Select("SELECT * FROM feedbacks")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "submissionsId", column = "submissions_id"),
            @Result(property = "feedbackScore", column = "feedback_score"),
            @Result(property = "feedbackComment", column = "feedback_comment"),
    })
    List<Feedback> getAllFeedbacks();

    // Read One (SELECT)
    @Select("SELECT * FROM feedbacks WHERE feedback_id = #{feedback_id}")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "submissionsId", column = "submissions_id"),
            @Result(property = "feedbackScore", column = "feedback_score"),
            @Result(property = "feedbackComment", column = "feedback_comment"),
    })
    Feedback getFeedbackById(Integer feedback_id);

    // 받은 assignment_id에 매칭되는 submission_id가 있는 경우 그 feedback 들을 반환
    @Select("SELECT * FROM feedbacks WHERE submissions_id IN (SELECT submissions_id FROM submissions WHERE assignment_id = #{assignment_id})")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "submissionsId", column = "submissions_id"),
            @Result(property = "feedbackScore", column = "feedback_score"),
            @Result(property = "feedbackComment", column = "feedback_comment"),
    })
    List<Feedback> getFeedbacksByAssignmentId(Integer assignment_id);
}
