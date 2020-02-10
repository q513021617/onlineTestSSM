package com.dao;

import com.model.Testing;
import com.model.TestingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TestingMapper extends BaseDao<Testing>{
    long countByExample(TestingExample example);

    int deleteByExample(TestingExample example);

    int deleteByPrimaryKey(String id);

    int insert(Testing record);

    int insertSelective(Testing record);

    List<Testing> selectByExample(TestingExample example);

    Testing selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Testing record, @Param("example") TestingExample example);

    int updateByExample(@Param("record") Testing record, @Param("example") TestingExample example);

    int updateByPrimaryKeySelective(Testing record);

    int updateByPrimaryKey(Testing record);
}