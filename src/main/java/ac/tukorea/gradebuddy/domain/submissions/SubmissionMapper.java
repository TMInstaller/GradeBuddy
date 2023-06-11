package ac.tukorea.gradebuddy.domain.submissions;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SubmissionMapper {
    // Create(INSERT)
    @Insert("INSERT INTO submissions (user_id, assignment_id, submission_time) " +
            "VALUES (#{userId}, #{assignmentId}, #{submissionTime})")
    @Options(useGeneratedKeys = true, keyProperty = "submissionsId")
    @Results({
            @Result(property = "submissionsId", column = "submissions_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "submissionTime", column = "submission_time")
    })
    void createSubmission(Submission submission);

    // Read All(SELECT)
    @Select("SELECT * FROM submissions")
    @Results({
            @Result(property = "submissionsId", column = "submissions_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "submissionTime", column = "submission_time")
    })
    List<Submission> getAllSubmissions();

}
