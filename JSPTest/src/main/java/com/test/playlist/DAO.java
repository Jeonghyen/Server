package com.test.playlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.memo.DBUtil;
import com.test.memo.DTO;

public class DAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public DAO() {
		
		conn = DBUtil.open();
	}

	public int add(com.test.playlist.DTO dto) {
		
		try {
			
			String sql = "insert into tblPlay values (seqPlay.nextVal, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getSinger());
			
			
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("DAO.add");
			e.printStackTrace();
		}
		
		return 0;
	}



	public ArrayList<com.test.playlist.DTO> list() {
			
		try {

			ArrayList<com.test.playlist.DTO> list =  new ArrayList<com.test.playlist.DTO>();
			String sql = "select * from tblPlay";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				
				com.test.playlist.DTO dto =  new com.test.playlist.DTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setSinger(rs.getString("singer"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("DAO.list");
			e.printStackTrace();
		}
		
		return null;
	}


}
