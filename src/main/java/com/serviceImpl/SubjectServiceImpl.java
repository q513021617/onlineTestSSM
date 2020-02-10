package com.serviceImpl;

import com.dao.BaseDao;
import com.dao.SubjectMapper;
import com.service.SubjectService;
import com.model.Subject;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SubjectServiceImpl extends BaseServiceImpl<Subject> implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;
    private BaseDao<User> baseDao;

    @Override
    public void setBaseDao(Object object) {
        this.subjectMapper=(SubjectMapper)object;
        super.setBaseDao(this.subjectMapper);
    }
}
