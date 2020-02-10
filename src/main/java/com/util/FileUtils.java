package com.util;

import com.model.TopicItem;

import java.util.ArrayList;
import java.util.List;
/**
 * 试题上传转换格式工具类
 * */
public class FileUtils {
    private int i = 1;
    String getAnsIteam(List<String> lines, String select, String last) {
        StringBuffer ans = new StringBuffer();
        while (i < lines.size()) {
            if (lines.get(i).equals("") || lines.get(i).equals(null)) {
                i++;
                continue;
            }
            if (lines.get(i).equals("endl") || lines.get(i).trim().substring(0, last.length()).equals(last))
                break;
            if (ans.length() > 0)
                ans.append("\n");
            if (select.length() > 0 && select.charAt(0) >= 'A' && select.charAt(0) <= 'D')
                ans.append(mytrim(lines.get(i), 2));
            else
                ans.append(mytrim(lines.get(i), 0));
            i++;
        }
        return ans.toString();
    }

    /**
     * @param str 带去空格或制表符的字符串
     * */
    String mytrim(String str, int flag) {
        for (int j = 0; j < str.length(); j++) {
            if (str.charAt(j) == ' ' || str.charAt(j) == '\t')
                continue;
            return str.substring(j + flag).trim();
        }
        return "";
    }

    public List<TopicItem> getTopicList(List<String> lines) throws Exception {
        List<TopicItem> list = new ArrayList<TopicItem>();
        TopicItem item;
        String temp = lines.get(0).trim();
        while ((i + 6) < lines.size()) {//一个选择题至少占据6行
            item = new TopicItem();
            item.setDescription(getAnsIteam(lines, "", "A"));
            item.setAnsItemsA(getAnsIteam(lines, "A", "B"));
            item.setAnsItemsB(getAnsIteam(lines, "B", "C"));
            item.setAnsItemsC(getAnsIteam(lines, "C", "D"));
            item.setAnsItemsD(getAnsIteam(lines, "D", "答案"));
            item.setAnswer(lines.get(i).substring(lines.get(i).length() - 1));
            i++;
            item.setSubject(temp);
            item.setType("0");
            list.add(item);
        }
        return list;
    }
}
