package cn.duli.service.impl;

import cn.duli.service.UploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Service("uploadService")
public class uploadServiceImpl implements UploadService {
    @Override
    public String upload(MultipartFile multipartFile, HttpServletRequest request) {
        String uploadPath = request.getSession().getServletContext().getRealPath("/uploadImg/");
        //一。传到哪里去？二。传什么东西？三。传的细节
        //1.判断
        String newFileName = "";
        if (multipartFile != null && !multipartFile.isEmpty()) {
            //不空才传
            // 2.获取原始的文件名
            String originalFilename = multipartFile.getOriginalFilename();

            //3.先截取原文件的文件名前缀，不带后缀
            String fileNamePrefix = originalFilename.substring(0,originalFilename.lastIndexOf("."));

            //4.加工处理文件名，将原文件名+时间戳
            String newFileNamePrefix = fileNamePrefix + new Date().getTime();

            //5.得到新文件名
            newFileName = newFileNamePrefix + originalFilename.substring(originalFilename.lastIndexOf("."));

            //6.构建文件对象
            File file = new File(uploadPath + newFileName);
            if (!file.exists()){
                file.mkdir();
            }
            System.out.println("新文件名："+newFileName);

            //7.上传
            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "/uploadImg/" + newFileName;
    }
}
