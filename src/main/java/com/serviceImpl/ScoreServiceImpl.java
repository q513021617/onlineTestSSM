package com.serviceImpl;

import com.dao.BaseDao;
import com.dao.ScoreMapper;
import com.service.ScoreService;
import com.model.Score;
import com.model.User;
import com.util.TimestampUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional
public class ScoreServiceImpl extends BaseServiceImpl<Score> implements ScoreService {

    @Autowired
    private ScoreMapper scoreMapper;
    private BaseDao<User> baseDao;

    @Override
    public void setBaseDao(Object object) {
        this.scoreMapper=(ScoreMapper)object;
        super.setBaseDao(this.scoreMapper);
    }

    @Override
    public List<Score> selectByAllByUserId(String stuid) {

        List<Score> scoreList=scoreMapper.selectByAllByUserId(stuid);

        for (Score score:scoreList) {
            score.setTimestr(TimestampUtil.stampToDate(String.valueOf(score.getTime())));
        }

        return scoreMapper.selectByAllByUserId(stuid);
    }
}
