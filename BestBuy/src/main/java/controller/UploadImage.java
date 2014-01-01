/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author HOANG
 */
public class UploadImage implements ServletRequestAware {

    private HttpServletRequest request;
    private String previous;
    private File upload;
    private String uploadContentType;
    private String uploadFileName;

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getPrevious() {
        return previous;
    }

    public void setPrevious(String previous) {
        this.previous = previous;
    }

    public String execute() throws IOException {
        String temp = request.getHeader("Referer");
        previous = temp.substring(temp.lastIndexOf('/') + 1);
        String name = "temp" + uploadFileName.substring(uploadFileName.lastIndexOf('.'));
        String filePath = request.getSession().getServletContext().getRealPath("/") + "images\\" + name;
        File newFile = new File(filePath);
        FileUtils.copyFile(upload, newFile);
        setUploadFileName("images/" + name);
        return "success";
    }
}
