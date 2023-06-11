package ac.tukorea.gradebuddy.domain.assignments;

import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AssignmentMapper {
    // Create (INSERT)
    @Insert("INSERT INTO assignments (user_id, assignment_title, assignment_description, assignment_deadline) " +
            "VALUES (#{userId}, #{assignmentTitle}, #{assignmentDescription}, #{assignmentDeadline})")
    @Options(useGeneratedKeys = true, keyProperty = "assignmentId")
    @Results({
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentTitle", column = "assignment_title"),
            @Result(property = "assignmentDescription", column = "assignment_description"),
            @Result(property = "assignmentDeadline", column = "assignment_deadline")
    })
    void createAssignment(Assignment assignment);

    // Read (SELECT)
    @Select("SELECT * FROM assignments WHERE assignment_id = #{assignment_id}")
    @Results({
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentTitle", column = "assignment_title"),
            @Result(property = "assignmentDescription", column = "assignment_description"),
            @Result(property = "assignmentDeadline", column = "assignment_deadline")
    })
    Assignment getAssignmentById(Integer assignment_id);

    // Read (SELECT) all assignments
    @Select("SELECT * FROM assignments")
    @Results({
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentTitle", column = "assignment_title"),
            @Result(property = "assignmentDescription", column = "assignment_description"),
            @Result(property = "assignmentDeadline", column = "assignment_deadline")
    })
    List<Assignment> getAllAssignments();

    // Update (UPDATE)
    @Update("UPDATE assignments SET assignment_title = #{assignmentTitle}, " +
            "assignment_description = #{assignmentDescription}, assignment_deadline = #{assignmentDeadline} " +
            "WHERE assignment_id = #{assignmentId}")
    @Results({
            @Result(property = "assignmentId", column = "assignment_id"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "assignmentTitle", column = "assignment_title"),
            @Result(property = "assignmentDescription", column = "assignment_description"),
            @Result(property = "assignmentDeadline", column = "assignment_deadline")
    })
    void updateAssignment(Assignment assignment);

    // Delete (DELETE)
    @Delete("DELETE FROM assignments WHERE assignment_id = #{assignment_id}")
    void deleteAssignment(@Param("assignment_id") Integer assignment_id);
}
