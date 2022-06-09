package memo.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import memo.model.dto.MemoDTO;

public class MemoDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	
	public ArrayList<MemoDTO> getSelectAll(String searchGubun, String searchData, int startRecord, int lastRecord) {
		if(searchGubun == null||searchGubun.trim().equals("")){
			searchGubun = "";
		}
		if(searchData == null||searchData.trim().equals("")){
			searchData = "";
		}
		if(searchGubun.trim().equals("")||searchData.trim().equals("")){
			searchGubun = "";
			searchData = "";
		}
		
		ArrayList<MemoDTO> list = new ArrayList<>();
		try {
			conn = DB.dbConn();
			String basicSql = "select no, name, memo, to_char(regiDate, 'YYYY-MM-DD HH24:MI:SS')regiDate2, regiDate from memo ";
			if(searchGubun.equals("")||searchData.equals("")) {	}
			else if(searchGubun.equals("name")) {
				basicSql += "where name like ? ";
			}else if(searchGubun.equals("memo")) {
				basicSql += "where memo like ? ";
			}else if(searchGubun.equals("name_memo")) {
				basicSql += "where (name like ?) or (memo like ?) ";
			}
			basicSql += "order by no desc ";
			
			String sql = "";
			sql += "select * from ( Select A.*, Rownum rnum from ( ";
			sql += basicSql;
			sql += " ) A) where rnum >= ? and rnum <= ? ";
			
			pstmt = conn.prepareStatement(sql);
			if(searchGubun.equals("")||searchData.equals("")) {	
				pstmt.setInt(1, startRecord);
				pstmt.setInt(2, lastRecord);
			}
			else if(searchGubun.equals("name")) {
				pstmt.setString(1, '%' + searchData + '%');
				pstmt.setInt(2, startRecord);
				pstmt.setInt(3, lastRecord);
			}else if(searchGubun.equals("memo")) {
				pstmt.setString(1, '%' + searchData + '%');
				pstmt.setInt(2, startRecord);
				pstmt.setInt(3, lastRecord);
			}else if(searchGubun.equals("name_memo")) {
				pstmt.setString(1, '%' + searchData + '%');
				pstmt.setString(2, '%' + searchData + '%');
				pstmt.setInt(3, startRecord);
				pstmt.setInt(4, lastRecord);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegiDate(rs.getString("regiDate2"));
				dto.setRegiDate2(rs.getDate("regiDate"));
				
				list.add(dto);
			}
			//------------------------------------
		}catch(Exception e) {
			//e.printStackTrace();
		}finally {
			DB.DBConnClose(rs, pstmt, conn);
		}
		return list;
	}
	

	public MemoDTO getSelectOne(MemoDTO paramDto) {
		MemoDTO dto = new MemoDTO();
		try {
			conn = DB.dbConn();
			// ------------------------------------
			String sql = "select no, name, memo, to_char(regiDate, 'YYYY-MM-DD HH24:MI:SS')regiDate from memo  where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String memo = rs.getString("memo");
				String regiDate = rs.getString("regiDate");

				dto.setNo(no);
				dto.setName(name);
				dto.setMemo(memo);
				dto.setRegiDate(regiDate);
			} // ------------------------------------
		} catch (Exception e) { // e.printStackTrace();

		} finally {
			DB.DBConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(MemoDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------
			String sql = "insert into memo values(seq_memo.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getMemo());
			result = pstmt.executeUpdate();
			//------------------------------------
		}catch(Exception e) {
			//e.printStackTrace();
		}finally {
			DB.DBConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int getTotalRecord(String searchGubun, String searchData) {
		int result = 0;
		if(searchGubun == null||searchGubun.trim().equals("")){
			searchGubun = "";
		}
		if(searchData == null||searchData.trim().equals("")){
			searchData = "";
		}
		if(searchGubun.trim().equals("")||searchData.trim().equals("")){
			searchGubun = "";
			searchData = "";
		}
		try {
			conn = DB.dbConn();
			//------------------------------------
			String sql = "";
			sql += "select count(*) counter from memo where 1=1 ";
			if(searchGubun.equals("")||searchData.equals("")) {	}
			else if(searchGubun.equals("name")) {
				sql += "and name like ? ";
			}else if(searchGubun.equals("memo")) {
				sql += "and memo like ? ";
			}else if(searchGubun.equals("name_memo")) {
				sql += "and ( name like ? ) or (memo like ? ) ";
			}
			pstmt = conn.prepareStatement(sql);
			
			if(searchGubun.equals("")||searchData.equals("")) {	}
			else if(searchGubun.equals("name")) {
				pstmt.setString(1, '%' + searchData + '%');
			}else if(searchGubun.equals("memo")) {
				pstmt.setString(1, '%' + searchData + '%');
			}else if(searchGubun.equals("name_memo")) {
				pstmt.setString(1, '%' + searchData + '%');
				pstmt.setString(2, '%' + searchData + '%');
			}
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("counter");
			}
			//------------------------------------
		}catch(Exception e) {
			//e.printStackTrace();
		}finally {
			DB.DBConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	
	
	
	
	public int setUpdate(MemoDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------
			String sql = "update memo set name = ?, memo = ? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getMemo());
			pstmt.setInt(3, paramDto.getNo());
			result = pstmt.executeUpdate();
			
			
			//------------------------------------
		}catch(Exception e) {
			//e.printStackTrace();
		}finally {
			DB.DBConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(MemoDTO paramDto) {
		int result = 0;
		try {
			conn = DB.dbConn();
			//------------------------------------
			String sql = "delete from memo where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			result = pstmt.executeUpdate();
			
			//------------------------------------
		}catch(Exception e) {
			//e.printStackTrace();
		}finally {
			DB.DBConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	
	public int setDeleteBatch(String[] array) {
		int result = 0;
		int[] count = new int[array.length];
		try {
			conn = DB.dbConn();
			//------------------------------------
			conn.setAutoCommit(false);
			
			String sql = "delete from memo where no = ? ";
			pstmt = conn.prepareStatement(sql);
			
			for(int i=0; i<array.length; i++) {
				pstmt.setInt(1, Integer.parseInt(array[i]));
				pstmt.addBatch();
			}
			
			count = pstmt.executeBatch();
			conn.commit();
			//------------------------------------
		}catch(Exception e) {
			//e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				conn.setAutoCommit(true);
			}catch(Exception e3) {
				e3.printStackTrace();
			}
			DB.DBConnClose(rs, pstmt, conn);
		}
		result = count.length;
		System.out.println("result : " + result);
		return result;
	}
}

	
