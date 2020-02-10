package com.serviceImpl;

import com.dao.BaseDao;
import com.dao.SitedataMapper;
import com.service.SitedataService;
import com.model.Sitedata;
import com.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SitedataServiceImpl extends BaseServiceImpl<Sitedata> implements SitedataService {

    @Autowired
    private SitedataMapper sitedataMapper;
    private BaseDao<User> baseDao;

    @Override
    public void setBaseDao(Object object) {
        this.sitedataMapper=(SitedataMapper)object;
        super.setBaseDao(this.sitedataMapper);
    }
}
