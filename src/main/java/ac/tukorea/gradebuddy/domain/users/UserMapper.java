package ac.tukorea.gradebuddy.domain.users;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    @Select("SELECT * FROM users WHERE email = #{email} AND password = #{password}")
    User findUserByEmailAndPassword(@Param("email") String email, @Param("password") String password);
}
