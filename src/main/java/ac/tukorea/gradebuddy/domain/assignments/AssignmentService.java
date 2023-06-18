// Service: 비즈니스 로직을 수행하며, 필요에 따라 데이터의 조회, 저장 등을 위해 DAO를 사용합니다.
package ac.tukorea.gradebuddy.domain.assignments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.Assign;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentService {
    private final AssignmentMapper assignmentMapper;

    @Autowired
    public AssignmentService(AssignmentMapper assignmentMapper) {
        this.assignmentMapper = assignmentMapper;
    }

    public void createAssignment(Assignment assignment) {
        assignmentMapper.createAssignment(assignment);
    }

    public Assignment getAssignmentById(Integer assignment_id) {
        return assignmentMapper.getAssignmentById(assignment_id);
    }

    public List<Assignment> getAllAssignments() {
        return assignmentMapper.getAllAssignments();
    }

    public void updateAssignment(Assignment assignment) {
        assignmentMapper.updateAssignment(assignment);
    }

    public void deleteAssignment(Integer assignmentId) {
        assignmentMapper.deleteAssignment(assignmentId);
    }
}
