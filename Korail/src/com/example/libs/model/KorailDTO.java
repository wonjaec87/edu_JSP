package com.example.libs.model;

public class KorailDTO {
   private String tsc; //열차좌석코드
   private String pcode; //장소코드
   private String pn; //주민등록번호
   private String hcode; //할증코드
   private String tcode; //열차코드
   private String tname; //열차명,기차
   private String scode; //좌석코드
   private String seat; //좌석명
   private String place; //장소명,지역
   private int way; //거리
   private String wayfee; //km당 단가
   private String htype; //할증종류
   private int dp; //할인율
   private int num; //번호
   private String gender; //성별
   private int discount; //할인액
   private int carfee; //차비
   private int locfee;//지역별 차비
   private int sumfee;//총차비
   private int fee;//금액

public int getFee() {
   return fee;
}

public void setFee(int fee) {
   this.fee = fee;
}

public KorailDTO() {} //기본 생성자
   
   public KorailDTO(String tsc, String pcode, String pn, String hcode) { //입력용 생성자
      super();
      this.tsc = tsc;
      this.pcode = pcode;
      this.pn = pn;
      this.hcode = hcode;
   }

   public KorailDTO(String tname, String seat, String place, String htype, int num, String gender, int discount,
         int carfee) { //출력용 생성자
      super();
      this.tname = tname;
      this.seat = seat;
      this.place = place;
      this.htype = htype;
      this.num = num;
      this.gender = gender;
      this.discount = discount;
      this.carfee = carfee;
   }

   public String getTsc() {
      return tsc;
   }

   public void setTsc(String tsc) {
      this.tsc = tsc;
   }

   public String getPcode() {
      return pcode;
   }

   public void setPcode(String pcode) {
      this.pcode = pcode;
   }

   public String getPn() {
      return pn;
   }

   public void setPn(String pn) {
      this.pn = pn;
   }

   public String getHcode() {
      return hcode;
   }

   public void setHcode(String hcode) {
      this.hcode = hcode;
   }

   public String getTcode() {
      return tcode;
   }

   public void setTcode(String tcode) {
      this.tcode = tcode;
   }

   public String getTname() {
      return tname;
   }

   public void setTname(String tname) {
      this.tname = tname;
   }

   public String getScode() {
      return scode;
   }

   public void setScode(String scode) {
      this.scode = scode;
   }

   public String getSeat() {
      return seat;
   }

   public void setSeat(String seat) {
      this.seat = seat;
   }

   public String getPlace() {
      return place;
   }

   public void setPlace(String place) {
      this.place = place;
   }

   public int getWay() {
      return way;
   }

   public void setWay(int way) {
      this.way = way;
   }

   public String getWayfee() {
      return wayfee;
   }

   public void setWayfee(String wayfee) {
      this.wayfee = wayfee;
   }

   public String getHtype() {
      return htype;
   }

   public void setHtype(String htype) {
      this.htype = htype;
   }

   public int getDp() {
      return dp;
   }

   public void setDp(int dp) {
      this.dp = dp;
   }

   public int getNum() {
      return num;
   }

   public void setNum(int num) {
      this.num = num;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public int getDiscount() {
      return discount;
   }

   public void setDiscount(int discount) {
      this.discount = discount;
   }

   public int getCarfee() {
      return carfee;
   }

   public void setCarfee(int carfee) {
      this.carfee = carfee;
   }
   
   public int getLocfee() {
      return locfee;
   }
   
   public void setLocfee(int locfee) {
      this.locfee = locfee;
   }
   
   public int getSumfee() {
      return sumfee;
   }
   
   public void setSumfee(int sumfee) {
      this.sumfee = sumfee;
   }
   
   
}