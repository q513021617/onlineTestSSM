package com.dao;

import com.model.Testpaper;

import java.util.List;

public interface TestpaperMapper extends BaseDao<Testpaper>{
    int deleteByPrimaryKey(String id);

    int insert(Testpaper record);

    int insertSelective(Testpaper record);

    Testpaper selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Testpaper record);
    List<Testpaper> selectByAllBypage();
    List<Testpaper> selectByTestid(String id);
    int updateByPrimaryKey(Testpaper record);
    List<String> selectAllpaperId();
}