package com.datapps.report.ant;

import com.atlantbh.jmeter.plugins.jtlparser.JtlParser;
import com.atlantbh.jmeter.plugins.jtlparser.builder.JunitModelBuilder;
import com.atlantbh.jmeter.plugins.jtlparser.builder.JunitXmlBuilder;
import com.atlantbh.jmeter.plugins.jtlparser.model.jtl.ThreadGroup;
import com.atlantbh.jmeter.plugins.jtlparser.model.junit.TestSuite;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;

public class JUnitReportTask extends Task {

    private String sourceDir;
    private String destDir;
    private String destFile;

    public void execute() throws BuildException {
        System.out.println("Generate JUnit Style report from jtl files...");
        System.out.println("Scan source dir: " + sourceDir);
        File sourceFolder = new File(sourceDir);
        if (!sourceFolder.exists()) {
            System.err.println("Source dir not found: " + sourceDir);
            return;
        }

        if (destDir == null) {
            destDir = ".";
        }
        File targetFolder = new File(destDir);
        if (!targetFolder.exists()) {
            targetFolder.mkdirs();
        }
        System.out.println("Use dest dir: " + targetFolder.getAbsolutePath());
        if (destFile == null || destFile.isEmpty()) {
            destFile = "files.xml";
        }

        File[] jtls = sourceFolder.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".jtl");
            }
        });

        for (File jtlFile : jtls) {
            String filename = jtlFile.getName();
            filename = filename.substring(0, filename.lastIndexOf("."));
            File xmlFile = new File(targetFolder, filename + ".xml");
            generateJUnitXmlReport(filename, jtlFile.getAbsolutePath(), xmlFile.getAbsolutePath());
        }
    }

    private void generateJUnitXmlReport(String testSuiteName, String jtlFilename, String xmlFilename) {
        System.out.println("Generate JUnit report " + xmlFilename);
        JtlParser parser = new JtlParser();
        try {
            NodeList list = parser.getStartNode(jtlFilename);
            parser.parseJtl(list, null);

            ArrayList<ThreadGroup> threads = parser.getThreadGroups();
            JunitModelBuilder builder = JunitModelBuilder.newInstance();
            TestSuite testSuite = builder.generateTestSuite(threads);
            testSuite.setName(testSuiteName);
            ArrayList<TestSuite> testSuites = new ArrayList<TestSuite>();
            testSuites.add(testSuite);

            JunitXmlBuilder xmlBuilder = JunitXmlBuilder.newInstance();
            Document doc = xmlBuilder.generateXmlDoc(testSuites);
            xmlBuilder.writeXmlDoc(doc, xmlFilename);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getSourceDir() {
        return sourceDir;
    }

    public void setSourceDir(String sourceDir) {
        this.sourceDir = sourceDir;
    }

    public String getDestDir() {
        return destDir;
    }

    public void setDestDir(String destDir) {
        this.destDir = destDir;
    }

    public static void main(String[] args) {
        JUnitReportTask task = new JUnitReportTask();
        task.setSourceDir("target/report/jtl");
        task.setDestDir("target/report/junit");
        task.execute();
    }
}
