package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class KorailDAO {
   public static Vector<KorailDTO> select() throws SQLException{
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT * FROM TOTAL";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs= pstmt.executeQuery();
      Vector<KorailDTO> vector = new Vector<KorailDTO>(1,1);
      if(!rs.next()) {
         vector = null;
      }else {
         do {
            KorailDTO ko = new KorailDTO(rs.getString("seat"), rs.getString("place"),
                        rs.getString("gender"), rs.getString("tname"), rs.getInt("num"),
                        rs.getString("htype"), rs.getInt("discount"), rs.getInt("carfee"));
            vector.add(ko);
         }while(rs.next());
      }
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return vector;
   }
   //열차좌석
      public static String selectTname(String code) throws SQLException{
            Connection conn = DBConnection.getConnection();
            
            String sql = "SELECT tname FROM TRAINCODE WHERE tcode = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, code);
            ResultSet rs= pstmt.executeQuery();
            rs.next();
            String tname = rs.getString("tname");
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close(); 
            DBClose.close(conn);
            return tname;
         }
         
         public static String selectSeat(String code) throws SQLException{
            Connection conn = DBConnection.getConnection();
            
            String sql = "SELECT seat FROM TRAINCODE WHERE scode = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, code);
            ResultSet rs= pstmt.executeQuery();
            rs.next();
            String seat = rs.getString("seat");
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close(); 
            DBClose.close(conn);
            return seat;
         }
         //장소코드
         public static String selectPlace(String code) throws SQLException{
            Connection conn = DBConnection.getConnection();
            
            String sql = "SELECT place FROM PLACECODE WHERE pcode = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, code);
            ResultSet rs= pstmt.executeQuery();
            rs.next();
            String place = rs.getString("place");
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close(); 
            DBClose.close(conn);
            return place;
         }
         
         public static int selectWay(String code) throws SQLException{
            Connection conn = DBConnection.getConnection();
            
            String sql = "SELECT way FROM PLACECODE WHERE pcode = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, code);
            ResultSet rs= pstmt.executeQuery();
            rs.next();
            int way = rs.getInt("way");
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close(); 
            DBClose.close(conn);
            return way;
         }
   //km당 단가
   public static int select1(String train1) throws SQLException{
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT wayfee FROM PRICE WHERE train='새마을호' AND seat=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,train1); 
      ResultSet rs = pstmt.executeQuery();
      rs.next();
      int wayfee = rs.getInt("wayfee");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return wayfee;
   }
   public static int select2(String train2) throws SQLException{
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT wayfee FROM PRICE WHERE train='무궁화호' AND seat=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,train2); 
      ResultSet rs = pstmt.executeQuery();
      rs.next();
      int wayfee = rs.getInt("wayfee");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return wayfee;
   }
   public static int select3(String train3) throws SQLException{
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT wayfee FROM PRICE WHERE train='통일호' AND seat=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,train3); 
      ResultSet rs = pstmt.executeQuery();
      rs.next();
      int wayfee = rs.getInt("wayfee");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return wayfee;
   }
   //할증 코드
   public static int select(String hcode) throws SQLException{
         Connection conn = DBConnection.getConnection();
         String sql = "SELECT dp FROM Department WHERE hcode = ?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, hcode);
         ResultSet rs= pstmt.executeQuery();
         rs.next();
         int dp = Integer.parseInt(rs.getString("dp"));
         if(rs != null) rs.close();
         if(pstmt != null) pstmt.close(); 
         DBClose.close(conn);
         return dp;
      }
   
   public static int insert(KorailDTO kor) throws SQLException{
	      Connection conn = DBConnection.getConnection();
	      String sql = "INSERT INTO Korail VALUES(?,?,?,?)";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, kor.getTsc());
	      pstmt.setString(2, kor.getPcode());
	      pstmt.setString(3, kor.getPn());
	      pstmt.setString(4, kor.getHcode());
	   
	      int row = pstmt.executeUpdate();
	      if(pstmt != null) pstmt.close();
	      DBClose.close(conn);
	      return row;
	   }
}