package Service;

import com.dao.UserMapper;
import com.model.TopicItem;
import com.model.User;
import com.service.TopicItemService;
import com.service.UserService;
import com.serviceImpl.TopicItemServiceImpl;
import com.util.ReadImageUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;


public class TopicItemServiceTest extends BaseJunit4Test{

    @Autowired
    private TopicItemService topicItemService;

    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;
    @Test
    public void TopicItem(){

        try {
//            List<TopicItem> topicItemList =topicItemService.quryBySubject("","20");
//            topicItem.setType("20");
//            TopicItem topicItem=topicItemService.quryById("5cd53d561207e91e54e88e6d");
//            topicItemService.update(topicItem);
//            topicItemService.delete(topicItem);
//            TopicItem topicItem=new TopicItem();
//            topicItem.setAnsItems("A XXXX,B XXXX,C XX,D XXXX");
//            topicItem.setAnswer("A");
//            topicItem.setType("2");
//            topicItem.setTitle("null");
//            topicItem.setDescription("xxxxxxxx()");
//            topicItemService.insert(topicItem);
            User user=new User();
            user.setId("0b76dbe9b0e1476e909d8ced22352e2f");
            InputStream in= ReadImageUtils.getIns("F:\\code\\onlineTest\\src\\main\\webapp\\WEB-INF\\static\\images\\admin.jpg");

            user.setPhoto(in.readAllBytes());

          if(userMapper.updateByPrimaryKey(user)>0){
              System.out.println("success");
          }



            System.out.println();
        }catch (Exception e){
            e.printStackTrace();
        }


    }

}
