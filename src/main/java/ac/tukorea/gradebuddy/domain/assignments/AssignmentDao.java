// DAO: 데이터베이스 접근을 담당하며, 데이터 조회, 삽입, 업데이트, 삭제 등의 SQL 쿼리를 실행합니다.
package ac.tukorea.gradebuddy.domain.assignments;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AssignmentDao {

    private final SqlSession sqlSession;

    @Autowired
    public AssignmentDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<Assignment> getAllAssignments() {
        return sqlSession.selectList("getAllAssignments");
    }
}
