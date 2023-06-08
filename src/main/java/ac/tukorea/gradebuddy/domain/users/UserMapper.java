package ac.tukorea.gradebuddy.domain.users;

import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
    @Select("SELECT * FROM users WHERE email = #{email} AND password = #{password}")
    User findUserByEmailAndPassword(@Param("email") String email, @Param("password") String password);

    @Select("SELECT * FROM users WHERE email = #{email}")
    User findUserByEmail(@Param("email") String email);

    @Insert("INSERT INTO users (email, password, username) VALUES (#{email}, #{password}, #{username})")
    void createUser(User user);

    @Update("UPDATE users SET user_id = #{user_id}, email = #{email}, username = #{username} WHERE user_id = #{user_id}")
    void updateUser(User user);
}
