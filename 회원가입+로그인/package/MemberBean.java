package ch14;

// MemberBean 클래스는 회원 정보를 담는 자바 빈(JavaBean) 클래스입니다.
public class MemberBean {

    // 회원 아이디
    private String id;
    // 회원 비밀번호
    private String pwd;
    // 회원 이름
    private String name;
    // 회원 성별
    private String gender;
    // 회원 생년월일
    private String birthday;
    // 회원 이메일
    private String email;
    // 회원 우편번호
    private String zipcode;
    // 회원 주소
    private String address;
    // 회원 취미 (다중 선택 가능)
    private String hobby[];


    // Getter 및 Setter 메서드들

    // 아이디 Getter
    public String getId() {
        return id;
    }

    // 아이디 Setter
    public void setId(String id) {
        this.id = id;
    }

    // 비밀번호 Getter
    public String getPwd() {
        return pwd;
    }

    // 비밀번호 Setter
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    // 이름 Getter
    public String getName() {
        return name;
    }

    // 이름 Setter
    public void setName(String name) {
        this.name = name;
    }

    // 성별 Getter
    public String getGender() {
        return gender;
    }

    // 성별 Setter
    public void setGender(String gender) {
        this.gender = gender;
    }

    // 생년월일 Getter
    public String getBirthday() {
        return birthday;
    }

    // 생년월일 Setter
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    // 이메일 Getter
    public String getEmail() {
        return email;
    }

    // 이메일 Setter
    public void setEmail(String email) {
        this.email = email;
    }

    // 우편번호 Getter
    public String getZipcode() {
        return zipcode;
    }

    // 우편번호 Setter
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    // 주소 Getter
    public String getAddress() {
        return address;
    }

    // 주소 Setter
    public void setAddress(String address) {
        this.address = address;
    }

    // 취미 Getter
    public String[] getHobby() {
        return hobby;
    }

    // 취미 Setter
    public void setHobby(String[] hobby) {
        this.hobby = hobby;
    }


}
