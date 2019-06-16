package cn.duli.service;


import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface UploadService {

    /**
     * 上传图片
     * @param multipartFile
     * @param request
     * @return
     */
    //@RequestParam("img")不能与Pojo为pictureUrl的属性名一样
    String upload(MultipartFile multipartFile, HttpServletRequest request);
}
