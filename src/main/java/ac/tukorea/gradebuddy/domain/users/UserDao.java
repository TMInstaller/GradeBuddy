// DAO: 데이터베이스 접근을 담당하며, 데이터 조회, 삽입, 업데이트, 삭제 등의 SQL 쿼리를 실행합니다.
package ac.tukorea.gradebuddy.domain.users;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDao {

    private final SqlSession sqlSession;

    @Autowired
    public UserDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<User> getAllUsers() {
        return sqlSession.selectList("getAllUsers");
    }

    public User findUserByEmailAndPassword(String email, String password) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("password", password);
        return sqlSession.selectOne("findUserByEmailAndPassword", params);
    }
}
