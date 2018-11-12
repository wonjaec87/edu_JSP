package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.KorailDAO;
import com.example.libs.model.KorailDTO;

public class SelectController {
   public Vector<KorailDTO> select(){
      Vector<KorailDTO> vector = null;
      try {
         vector = KorailDAO.select();
      } catch (SQLException e) {
         System.out.println(e);
      }
      return vector;
   }
   public String selectTname(String code){
      String tname = null;
      try {
         tname = KorailDAO.selectTname(code);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return tname;
   }public String selectSeat(String code){
      String selectseat = null;
      try {
         selectseat = KorailDAO.selectSeat(code);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return selectseat;
   }public String selectPlace(String code){
      String selectplace = null;
      try {
         selectplace = KorailDAO.selectPlace(code);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return selectplace;
   }public int selectWay(String code){
      int selectway = 0;
      try {
         selectway = KorailDAO.selectWay(code);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return selectway;
   }public int select1(String train1){
      int select1 = 0;
      try {
         select1 = KorailDAO.select1(train1);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return select1;
   }public int select2(String train2){
      int select2 = 0;
      try {
         select2 = KorailDAO.select2(train2);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return select2;
   }public int select3(String train3){
      int select3 = 0;
      try {
         select3 = KorailDAO.select3(train3);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return select3;
   }public int select(String hcode){
      int select = 0;
      try {
         select = KorailDAO.select(hcode);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return select;
   }
   
}