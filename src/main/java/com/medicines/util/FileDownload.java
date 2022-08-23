package com.medicines.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownload extends AbstractView {
	public FileDownload() {
		setContentType("application/download; utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uploadDir=(String)model.get("uploadDir");
		String uploadFileName=(String)model.get("uploadFileName");
		String originFileName=(String)model.get("originFileName");
		
		File downloadFile=new File(uploadDir, uploadFileName);
		
		response.setContentType(getContentType());
		response.setContentLength((int)downloadFile.length());
		
		originFileName=URLEncoder.encode(originFileName, "utf-8");
		response.setHeader("Content-Disposition", "attachement;filename=\""+originFileName+"\";");
		
		OutputStream out=response.getOutputStream();
		
		FileInputStream in=null;
		try {
			in=new FileInputStream(downloadFile);
			
			FileCopyUtils.copy(in, out);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				in.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}