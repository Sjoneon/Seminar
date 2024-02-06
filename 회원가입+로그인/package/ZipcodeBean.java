package ch14;

// 우편번호 정보를 담는 ZipcodeBean 클래스

public class ZipcodeBean {

    private String zipcode;  // 우편번호를 저장하는 멤버 변수
    private String area1;    // 지역 정보(시/도)를 저장하는 멤버 변수
    private String area2;    // 지역 정보(구/군)를 저장하는 멤버 변수
    private String area3;    // 지역 정보(동/읍/면)를 저장하는 멤버 변수

    // 우편번호 getter 메서드
    public String getZipcode() {
        return zipcode;
    }

    // 우편번호 setter 메서드
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    // 지역 정보(시/도) getter 메서드
    public String getArea1() {
        return area1;
    }

    // 지역 정보(시/도) setter 메서드
    public void setArea1(String area1) {
        this.area1 = area1;
    }

    // 지역 정보(구/군) getter 메서드
    public String getArea2() {
        return area2;
    }

    // 지역 정보(구/군) setter 메서드
    public void setArea2(String area2) {
        this.area2 = area2;
    }

    // 지역 정보(동/읍/면) getter 메서드
    public String getArea3() {
        return area3;
    }

    // 지역 정보(동/읍/면) setter 메서드
    public void setArea3(String area3) {
        this.area3 = area3;
    }
}
