package com.datapps.report.ant;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

import java.io.*;

public class FileListXmlTask extends Task {

    private String sourceDir;
    private String destDir;
    private String destFile;
    private String extension;

    /**
     * @see Task#execute()
     */
    public void execute() throws BuildException {
        System.out.println("scan source dir: " + sourceDir);
        File sourceFolder = new File(sourceDir);
        if (!sourceFolder.exists()) {
            System.err.println("source dir not found: " + sourceDir);
            return;
        }

        if (destDir == null) {
            destDir = ".";
        }
        File targetFolder = new File(destDir);
        if (!targetFolder.exists()) {
            targetFolder.mkdirs();
        }
        System.out.println("use dest dir: " + targetFolder.getAbsolutePath());
        if (destFile == null || destFile.isEmpty()) {
            destFile = "files.xml";
        }
        File targetFile = new File(targetFolder, destFile);
        System.out.println("use dest file: " + targetFile.getAbsolutePath());

        try {
            generateXml(sourceFolder, targetFolder, targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void generateXml(File sourceFolder, File targetFolder, File targetFile) throws IOException {
        if (!targetFile.exists()) {
            targetFile.createNewFile();
        }
        final String fileExtension = extension == null ? ".jtl" : extension;
        String[] files = sourceFolder.list(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(fileExtension);
            }
        });

        BufferedWriter writer = new BufferedWriter(new FileWriter(targetFile));
        writer.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.newLine();
        writer.write("<dir name=\"" + targetFolder.getAbsolutePath() + "\">");
        writer.newLine();
        for (String file : files) {
            writer.write("    <file name=\"" + file + "\" />");
            writer.newLine();
        }
        writer.write("</dir>");
        writer.newLine();
        writer.flush();
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

    public String getDestFile() {
        return destFile;
    }

    public void setDestFile(String destFile) {
        this.destFile = destFile;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public static void main(String[] args) {
        FileListXmlTask task = new FileListXmlTask();
        task.setSourceDir("jtl");
        task.setDestDir("filelist");
        task.setDestFile("files.xml");
        task.execute();
    }
}
