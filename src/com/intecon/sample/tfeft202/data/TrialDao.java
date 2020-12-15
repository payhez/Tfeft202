package com.intecon.sample.tfeft202.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.intecon.sample.tfeft202.model.Tfeft202;

public class TrialDao {

	private ConnectionBuilder cb = new ConnectionBuilder();
	
	private Connection connection = cb.getConnection();
	
	public List<Tfeft202> fetch() {
		
		List<Tfeft202> objectList = new ArrayList<>();
		String query = "select * from tfeft202";
		
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
		        String comp = rs.getString(2);
		        String itemCode = rs.getString(3);
		        String gtibCode = rs.getString(4);
		        String codeListName = rs.getString(5);
		        String objectName = rs.getString(6);
		        String crt_usr = rs.getString(7);
		        String crt_tst = rs.getString(8);
		        String upd_usr = rs.getString(9);
		        String upd_tst = rs.getString(10);
		        objectList.add(new Tfeft202(id,comp,itemCode,gtibCode,codeListName,objectName,crt_usr,crt_tst,upd_usr,upd_tst,true));
		      }
			
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
		return objectList;
	}
	
	public boolean update(Tfeft202 theObject) {
		
		String query = "UPDATE tfeft202 "
				+ "SET Comp = '" +theObject.getComp()+"', ItemCode = '" +theObject.getItemCode()+"', GtibCode = '" +theObject.getGtibCode()+"', UPD_USR = '"+theObject.getUpd_usr()+"', UPD_TST='"+theObject.getUpd_tst()+"' "
				+ "WHERE id =" +theObject.getId()+";";
		
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	public boolean delete(Tfeft202 theObject) {
		
		String query = "Delete from tfeft202 "
				+ "WHERE id =" +theObject.getId()+";";
		
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.executeUpdate();
			
		}catch (Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	
	public boolean insert(Tfeft202 theObject) {
		
		String query = "insert into tfeft202(Comp,ItemCode,GtibCode,CodeListName,ObjectName,CRT_USR,CRT_TST,isActive) values (?,?,?,?,?,?,?,true)";
		try {
			
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, theObject.getComp());
			ps.setString(2, theObject.getItemCode());
			ps.setString(3, theObject.getGtibCode());
			ps.setString(4, theObject.getCodeListName());
			ps.setString(5, theObject.getObjectName());
			ps.setString(6, theObject.getCrt_usr());
			ps.setString(7, theObject.getCrt_tst());
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	
}
