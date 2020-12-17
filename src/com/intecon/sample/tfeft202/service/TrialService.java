package com.intecon.sample.tfeft202.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.intecon.sample.tfeft202.data.TrialDao;
import com.intecon.sample.tfeft202.model.Tfeft202;

public class TrialService {
	
	private TrialDao dao = new TrialDao();
	
	public List<Tfeft202> fetch() {
		
		return dao.fetch();
	}
	
	public boolean update(Tfeft202 theObject) {
		
		theObject.setUpd_usr("1");
		theObject.setUpd_tst(getDateTime());
		
		return dao.update(theObject);
	}
	
	public boolean delete(Tfeft202 theObject) {
		
		theObject.setIsActive(false);
		
		return dao.delete(theObject);
	}
	
	public boolean insert(Tfeft202 theObject) {
		
		theObject.setObjectName("ABC");
		theObject.setCodeListName("ABC");
		theObject.setCrt_usr("1");
		theObject.setCrt_tst(getDateTime());
		theObject.setIsActive(true);
		
		return dao.insert(theObject);
	}
	
	private String getDateTime() {
		
		java.util.Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		String strDate = dateFormat.format(date);
		
		return strDate;
	}

}
