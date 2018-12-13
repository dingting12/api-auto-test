package com.atlantbh.jmeter.plugins.jtlparser;

import com.atlantbh.jmeter.plugins.jtlparser.JtlParser;
import com.atlantbh.jmeter.plugins.jtlparser.builder.JunitModelBuilder;
import com.atlantbh.jmeter.plugins.jtlparser.builder.JunitXmlBuilder;
import com.atlantbh.jmeter.plugins.jtlparser.model.jtl.ThreadGroup;
import com.atlantbh.jmeter.plugins.jtlparser.model.junit.TestSuite;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import java.util.ArrayList;

/**
 * Created by adnan on 12/12/15.
 */
public class SingleJtlConverter {
    public static void main(String[] args) {
        JtlParser parser = new JtlParser();
        String fileLocation = "/Users/adnan/example.jtl";
        try {
            NodeList list = parser.getStartNode(fileLocation);
            parser.parseJtl(list, null);

            ArrayList<ThreadGroup> threads = parser.getThreadGroups();
            JunitModelBuilder builder = JunitModelBuilder.newInstance();
            TestSuite testSuite = builder.generateTestSuite(threads);
            ArrayList<TestSuite> testSuites = new ArrayList<TestSuite>();
            testSuites.add(testSuite);

            JunitXmlBuilder xmlBuilder = JunitXmlBuilder.newInstance();
            Document doc = xmlBuilder.generateXmlDoc(testSuites);
            xmlBuilder.writeXmlDoc(doc, "/Users/adnan/parsedjunit.xml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
