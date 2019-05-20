package com.testjdbc.util;

import java.io.*;

public class AddContent {


    public static void addContent(String is_val,String os_val) {

        try {
            FileInputStream fis=new FileInputStream(is_val);

            FileOutputStream fos=new FileOutputStream(os_val,true);

            BufferedReader reader=new BufferedReader(new InputStreamReader(fis));

            BufferedWriter write=new BufferedWriter(new OutputStreamWriter(fos));

            String temp;


            while((temp=reader.readLine())!=null) {
                write.write(temp);
            }

            System.out.println("finshed");
            reader.close();
            write.close();

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

/*    public static void main(String[] args) {
        addContent("D:\\test\\data\\testblob1.dat","D:\\test\\data\\testblob4.dat");
    }*/
}
