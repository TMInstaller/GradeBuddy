package ac.tukorea.gradebuddy.domain.users;

import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {
    @Select("SELECT * FROM users WHERE email = #{email} AND password = #{password}")
    User findUserByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    @Select("SELECT * FROM users WHERE email = #{email}")
    User findUserByEmail(@Param("email") String email);

    @Select("SELECT users.username, SUM(feedbacks.feedback_score) AS totalScore " +
            "FROM users INNER JOIN feedbacks ON users.user_id = Feedbacks.user_id " +
            "GROUP BY Users.user_id, Users.username " +
            "ORDER BY totalScore DESC " +
            "LIMIT 5")
    List<Map<String, Object>> getTop5UserScore();

    @Insert("INSERT INTO users (email, password, username) VALUES (#{email}, #{password}, #{username})")
    void createUser(User user);

    @Update("UPDATE users SET user_id = #{user_id}, email = #{email}, username = #{username} WHERE user_id = #{user_id}")
    void updateUser(User user);
}
