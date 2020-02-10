package com.serviceImpl;

import com.dao.BaseDao;
import com.dao.TestpaperMapper;
import com.service.TestpaperService;
import com.model.Testpaper;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TestpaperServiceImpl extends BaseServiceImpl<Testpaper> implements TestpaperService {

    @Autowired
    private TestpaperMapper testpaperMapper;
    private BaseDao<User> baseDao;

    @Override
    public void setBaseDao(Object object) {
        this.testpaperMapper=(TestpaperMapper)object;
        super.setBaseDao(this.testpaperMapper);
    }

    @Override
    public List<Testpaper> selectByTestid(String id) {
        return testpaperMapper.selectByTestid(id);
    }
}
