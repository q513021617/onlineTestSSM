package com.service;

import com.model.Score;

import java.util.List;

public interface ScoreService extends BaseService {
    List<Score> selectByAllByUserId(String stuid);
}
