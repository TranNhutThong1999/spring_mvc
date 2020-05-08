package com.thong.Controller;

import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

public class ResourceURL implements ResourceLoaderAware {
	private ResourceLoader resourceAware;
	

	public void setResourceLoader(ResourceLoader resourceLoader) {
		// TODO Auto-generated method stub
		resourceAware=resourceLoader;
		
	}
	public Resource getResource(String duongdan) {
		return (Resource) resourceAware.getResource(duongdan);
	}
	

}
