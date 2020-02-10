package com.dao;


import com.model.Page;
import com.model.TopicItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;


import java.util.List;
@Component("TopicItemDao")
public class TopicItemDao {
    @Autowired
    private MongoTemplate mongoTemplate;
    public Page<TopicItem> selectApplyLogPage(Integer currentPage, Integer pageSize) {
        //创建查询对象
        Query query = new Query();
        //设置起始数
        query.skip((currentPage - 1) * pageSize);
        //设置查询条数
        query.limit(pageSize);

        //查询当前页数据集合
        List<TopicItem> ApplyLogList = mongoTemplate.find(query, TopicItem.class);
        //查询总记录数
        int count = (int) mongoTemplate.count(query, TopicItem.class);
        //创建分页实体对象
        Page<TopicItem> page = new Page<>();
        //添加每页的集合、数据总条数、总页数
//        page.set
        page.setRecords(ApplyLogList);
        page.setSize(count);
        page.setTotal(count % pageSize == 0 ? 1 : count / pageSize + 1);
        return page;
    }
}
