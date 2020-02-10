package com.serviceImpl;

import com.dao.TopicItemDao;
import com.model.Page;
import com.service.TopicItemService;
import com.model.TopicItem;
import com.service.TopicItemService;
import com.util.FileUtils;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.model.PicturesTable;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.ooxml.extractor.POIXMLTextExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFPictureData;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class TopicItemServiceImpl implements TopicItemService {

    @Autowired
    private MongoTemplate mongoTemplate;
    @Autowired
    private TopicItemDao topicItemDao;
    @Override
    public List<TopicItem> quryBySubject(String subject, String type, int start, int size) throws Exception {

        Query query = new Query();
        TopicItem topicItem = new TopicItem();
        topicItem.setId("1");
        query.skip(start);
        query.limit(size);
        query.addCriteria(new Criteria("type").is(type).and("subject").is(subject));

        return this.mongoTemplate.find(query, TopicItem.class);

    }

    @Override
    public Page<TopicItem> quryAllByPage(int page, int size) throws Exception {
        Page<TopicItem> page1=topicItemDao.selectApplyLogPage(page,size);
        return page1;
    }

    @Override
    public void update(TopicItem entity) throws Exception {



        Query query = new Query();
        query.addCriteria(new Criteria("_id").is(entity.getId()));
        Update update = new Update();
        update.set("description", entity.getDescription());
        update.set("title", entity.getTitle());
        update.set("type", entity.getType());
        update.set("subject", entity.getSubject());
        update.set("ansItemsA", entity.getAnsItemsA());
        update.set("ansItemsB", entity.getAnsItemsB());
        update.set("ansItemsC", entity.getAnsItemsC());
        update.set("ansItemsD", entity.getAnsItemsD());
        update.set("answer", entity.getAnswer());

        this.mongoTemplate.updateFirst(query, update, TopicItem.class);
    }

    @Override
    public void save(TopicItem entity) throws Exception {
        this.mongoTemplate.save(entity);
    }

    @Override
    public void insert(TopicItem entity) throws Exception {
        this.mongoTemplate.insert(entity);
    }

    @Override
    public void delete(TopicItem item) throws Exception {
        this.mongoTemplate.remove(item);
    }


    @Override
    public TopicItem quryById(String id) throws Exception {

        Query query = new Query();

        query.addCriteria(new Criteria("id").is(id));

        return this.mongoTemplate.findOne(query, TopicItem.class);
    }

    @Override
    public int insertAllFromFile(String path) throws Exception {
        if (!(path.endsWith(".doc") || path.endsWith(".docx")))
            return 0;
        InputStream is = new FileInputStream(path);
        HWPFDocument doc = new HWPFDocument(is);
        String buff = "";
        try {

            buff = doc.getDocumentText();
        } catch (Exception e) {
            return 0;
        }
        List<TopicItem> itemList = new FileUtils().getTopicList(java.util.Arrays.asList(buff.split("\r")));
        this.mongoTemplate.insertAll(itemList);
        return itemList.size();
    }
}
