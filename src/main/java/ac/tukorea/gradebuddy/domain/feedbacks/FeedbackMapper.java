package ac.tukorea.gradebuddy.domain.feedbacks;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface FeedbackMapper {
    // Create (INSERT)
    @Insert("INSERT INTO feedbacks (user_id, assignment_id, feedback_title, feedback_description, feedback_date) " +
            "VALUES (#{userId}, #{assignmentId}, #{feedbackTitle}, #{feedbackDescription}, #{feedbackDate})")
    @Options(useGeneratedKeys = true, keyProperty = "feedbackId")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "feedbackTitle", column = "feedback_title"),
            @Result(property = "feedbackDescription", column = "feedback_description"),
            @Result(property = "feedbackDate", column = "feedback_date")
    })
    void createFeedback(Feedback feedback);

    // Read All (SELECT)
    @Select("SELECT * FROM feedbacks")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "feedbackTitle", column = "feedback_title"),
            @Result(property = "feedbackDescription", column = "feedback_description"),
            @Result(property = "feedbackDate", column = "feedback_date")
    })
    List<Feedback> getAllFeedbacks();

    // Read One (SELECT)
    @Select("SELECT * FROM feedbacks WHERE feedback_id = #{feedback_id}")
    @Results({
            @Result(property = "feedbackId", column = "feedback_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "feedbackTitle", column = "feedback_title"),
            @Result(property = "feedbackDescription", column = "feedback_description"),
            @Result(property = "feedbackDate", column = "feedback_date")
    })
    Feedback getFeedbackById(Integer feedback_id);
}
