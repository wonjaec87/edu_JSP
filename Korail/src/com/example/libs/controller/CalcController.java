package com.example.libs.controller;

import com.example.libs.model.KorailDTO;

public class CalcController {
      private SelectController select;
      public CalcController() {   //Constructor
         select = new SelectController();
      }
      public void calc(KorailDTO kor) {
         String tname = kor.getTname();
         int wayfee = 0;
         if(kor.getTname()=="새마을호") {
            wayfee = this.select.select1(tname);
            kor.setWayfee(Integer.toString(wayfee));
         }else if(kor.getTname()=="무궁화호") {
            wayfee = this.select.select2(tname);
            kor.setWayfee(Integer.toString(wayfee));
         }else if(kor.getTname()=="통일호") {
            wayfee = this.select.select3(tname);
            kor.setWayfee(Integer.toString(wayfee));
         }
         
         
          
         int fee = kor.getWay() * Integer.parseInt(kor.getWayfee().substring(0,2));//금액 = 거리 * km 당 단가 80원
         kor.setFee(fee);
         String hcode = kor.getHcode();
         int dp = this.select.select(hcode);//할증코드
         int h = fee * dp;//할증 = 금액 * 할인율
         
         int carfee = fee - h;//차비 = 금액-할증
         kor.setCarfee(carfee);
         
         String pn = kor.getPn();//주민번호 남여 구분
         if(pn.substring(7,8) == "1") {
            kor.setGender("남");
         }else if (pn.substring(7,8) == "2") {
            kor.setGender("여");
         }
         
         String tsc = kor.getTsc();//열차좌석코드
         String tcode = tsc.substring(0, 2);//TA
         String scode = tsc.substring(2);//SA
         kor.setTcode(tcode); //열차코드
         kor.setScode(scode); // 좌석코드
         
      }
   }