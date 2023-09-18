package com.shopping.utility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shopping.controller.SuperController;

// Frontcontroller.doProcess, .init에서 사용하는 메서드를 모아놓은 클래스입니다.
public class MyUtility {
	public static void deleteOldImageFile(String webPath, MultipartRequest mr) {
		// Frontcontroller.doProcess에서 사용합니다.
		// 상품 수정시 과거에 업로드했던 이미지를 웹 서버에서 삭제합니다.
		String[] deleteImages = 
			{ 
					// "deleteImage01"은 prUpdateForm.jsp에서 옵니다.
					mr.getParameter("deleteImage01"), 
					mr.getParameter("deleteImage02"),
					mr.getParameter("deleteImage03")
			};
		for(String delFile : deleteImages) {
			if(delFile != null) {
				String deleteFile = webPath + "/" + delFile ;
				File target = new File(deleteFile) ;
				if(target.delete()) {
					System.out.println(deleteFile + " file delete success");
				}
			}
		}
	}
	
	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String uploadPath) {
		// FrontController.doProcess에서 사용합니다.
		// 이미지 업로드에 필요한 멀티 파트 객체를 생성하여 반환합니다.
		MultipartRequest mr = null;
		int maxPostSize = 10 * 1024 * 1024;
		String ENCODING = "UTF-8";
		
		try {
			mr = new MultipartRequest(
					request, 
					uploadPath,
					maxPostSize,
					ENCODING,
					new DefaultFileRenamePolicy());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mr;
	}
	
	public static Map<String, SuperController> getTodolistMap(String filename){
		// Frontcontroller.init에서 사용합니다.
		// todolist.txt에서 매핑정보를 읽어옵니다.
		Map<String, SuperController> map = new HashMap<String, SuperController>();
		
		Properties prop = getPropertiesData(filename);
		
		Enumeration<Object> keys = prop.keys() ;
		
		while(keys.hasMoreElements()) {
			String command = keys.nextElement().toString() ;
			String className = prop.getProperty(command);
			System.out.println(command + "/" + className);
			
			try {
				Class<?> handleClass = Class.forName(className);
				SuperController instance = (SuperController)handleClass.newInstance();
				
				map.put(command, instance) ;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return map;
	}
	private static Properties getPropertiesData(String webFullPathName) {
		// 이 파일 MyUtility.getSettingMap, .getTodolistMap에서 사용합니다.
		//스트림을 이용하여 프로퍼티 목록을 반환해 줍니다.
		FileInputStream fis = null;
		Properties prop = null;
		
		try {
			fis = new FileInputStream(webFullPathName);
			
			prop = new Properties();
			prop.load(fis);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(fis != null) {fis.close(); }
			}catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		System.out.println("MyUtility.getPropertiesData :: prop.toString()");
		System.out.println(prop.toString());
		
		return prop;
	}

	public static Map<String, String> getSettingMap(String webSettingName) {
		// Frontcontroller.init에서 사용합니다.
		// webSettinName 파일을 이용하여 자바의 Map 형식으로 반환해 줍니다.
		Map<String, String> map = new HashMap<String, String>();
		Properties prop = null;
		prop = getPropertiesData(webSettingName) ;
		
		Enumeration<Object> keys = prop.keys();
		while(keys.hasMoreElements()) {
			String key = keys.nextElement().toString();
			String value = prop.getProperty(key);
			//map.put(key, value);
			
	         try {
	             map.put(key, new String(value.getBytes("ISO-8859-1"), "UTF-8")) ;
	          } catch (UnsupportedEncodingException e) {
	             e.printStackTrace();
	          }
		}
		
		return map;
	}


}
