// Service: 비즈니스 로직을 수행하며, 필요에 따라 데이터의 조회, 저장 등을 위해 DAO를 사용합니다.
package ac.tukorea.gradebuddy.domain.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User findUserByEmailAndPassword(String email, String password) {
        return userMapper.findUserByEmailAndPassword(email, password);
    }

    public User findUserByEmail(String email) {
        return userMapper.findUserByEmail(email);
    }

    public void createUser(User user) {
        userMapper.createUser(user);
    }
}
