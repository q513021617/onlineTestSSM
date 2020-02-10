package com.dao;

import com.model.Sitedata;
import com.model.SitedataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SitedataMapper extends BaseDao<Sitedata>{
    long countByExample(SitedataExample example);

    int deleteByExample(SitedataExample example);

    int deleteByPrimaryKey(String id);

    int insert(Sitedata record);

    int insertSelective(Sitedata record);

    List<Sitedata> selectByExample(SitedataExample example);

    Sitedata selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Sitedata record, @Param("example") SitedataExample example);

    int updateByExample(@Param("record") Sitedata record, @Param("example") SitedataExample example);

    int updateByPrimaryKeySelective(Sitedata record);

    int updateByPrimaryKey(Sitedata record);
}