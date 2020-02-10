package com.util;

import java.io.*;

public class ReadImageUtils {
    /**
     * 读取本地图片的输入流
     * @return FileInputStream
     */
    public static FileInputStream getIns(String imagePath){
        try {
            return new FileInputStream(new File(imagePath));
        } catch (FileNotFoundException e) {
            System.out.println("请检查文件路径是否正确");
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 读取数据库表中图片的输出流
     * @param targetPath 图片存储到本地的路径
     * @return FileOutputStream
     */
    public static FileOutputStream getOuts(String targetPath){
        File file = new File(targetPath);
        String path = targetPath.substring(0,targetPath.lastIndexOf("/"));
        //如果文件不存在则创建目录
        if (!file.exists()){
            new File(path).mkdir();
        }

        FileOutputStream fos ;
        try {
            fos = new FileOutputStream(file);
            return fos;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 读取数据库中的图片二进制数据写出目标地址
     * @param in 输入流
     * @param out 输出流
     * @return boolean
     */
    public static boolean readBinaryImage(InputStream in, OutputStream out){
        try {
            int len;
            byte[] b = new byte[1000];
            while ((len=in.read(b)) != -1){
                out.write(b,0,len);
            }
            out.flush();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (null != out){
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != in){
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

}
