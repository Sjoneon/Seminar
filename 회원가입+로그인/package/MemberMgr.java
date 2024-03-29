package ch14;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

// 회원 정보를 관리하는 MemberMgr 클래스입니다.

public class MemberMgr {

    private DBConnectionMgr pool;  // 데이터베이스 연결 풀을 관리하는 객체

    // 생성자: 데이터베이스 연결 풀을 초기화합니다.
    public MemberMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 아이디 중복 확인 메서드
    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean flag = false;
        try {
            // 데이터베이스 연결
            con = pool.getConnection();
            // 아이디 중복 확인 쿼리
            sql = "select id from tblMember where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            // 쿼리 실행 결과 확인
            flag = pstmt.executeQuery().next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 연결 해제
            pool.freeConnection(con, pstmt, rs);
        }
        return flag;
    }

    // 지역명을 통한 우편번호 검색 메서드
    public Vector<ZipcodeBean> zipcodeRead(String area3) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
        try {
            // 데이터베이스 연결
            con = pool.getConnection();
            // 우편번호 검색 쿼리
            sql = "select * from tblZipcode where area3 like ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + area3 + "%");
            // 쿼리 실행 결과 처리
            rs = pstmt.executeQuery();
            while (rs.next()) {
                // 검색 결과를 ZipcodeBean 객체에 담고 벡터에 추가
                ZipcodeBean bean = new ZipcodeBean();
                bean.setZipcode(rs.getString(1));
                bean.setArea1(rs.getString(2));
                bean.setArea2(rs.getString(3));
                bean.setArea3(rs.getString(4));
                vlist.addElement(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 연결 해제
            pool.freeConnection(con, pstmt, rs);
        }
        return vlist;
    }

    // 회원 가입 메서드
    public boolean insertMember(MemberBean bean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        boolean flag = false;
        try {
            // 데이터베이스 연결
            con = pool.getConnection();
            // 회원 가입 쿼리
            sql = "insert tblMember(id,pwd,name,gender,birthday,email,zipcode,"
                    + "address,hobby,job)values(?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            // 쿼리에 파라미터 설정
            pstmt.setString(1, bean.getId());
            pstmt.setString(2, bean.getPwd());
            pstmt.setString(3, bean.getName());
            pstmt.setString(4, bean.getGender());
            pstmt.setString(5, bean.getBirthday());
            pstmt.setString(6, bean.getEmail());
            pstmt.setString(7, bean.getZipcode());
            pstmt.setString(8, bean.getAddress());
            String hobby[] = bean.getHobby();
            char hb[] = { '0', '0', '0', '0', '0' };
            String lists[] = { "음악감상", "영화감상", "등산", "운동", "요리" };
            for (int i = 0; i < hobby.length; i++) {
                for (int j = 0; j < lists.length; j++) {
                    if (hobby[i].equals(lists[j]))
                        hb[j] = '1';
                }
            }
            pstmt.setString(9, new String(hb));
            pstmt.setString(10, bean.getJob());
            // 쿼리 실행 결과 확인
            if (pstmt.executeUpdate() == 1)
                flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 연결 해제
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    // 로그인 메서드
    public boolean loginMember(String id, String pwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean flag = false;
        try {
            // 데이터베이스 연결
            con = pool.getConnection();
            // 로그인 쿼리
            sql = "select id from tblMember where id = ? and pwd = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            // 쿼리 실행 결과 확인
            rs = pstmt.executeQuery();
            flag = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 연결 해제
            pool.freeConnection(con, pstmt, rs);
        }
        return flag;
    }

    // 회원 정보 조회 메서드
    public MemberBean getMember(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean bean = null;
        try {
            // 데이터베이스 연결
            con = pool.getConnection();
            String sql = "select * from tblMember where id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            // 쿼리 실행 결과 확인
            rs = pstmt.executeQuery();
            if (rs.next()) {
                // 조회된 회원 정보를 MemberBean 객체에 담음
                bean = new MemberBean();
                bean.setId(rs.getString("id"));
                bean.setPwd(rs.getString("pwd"));
                bean.setName(rs.getString("name"));
                bean.setGender(rs.getString("gender"));
                bean.setBirthday(rs.getString("birthday"));
                bean.setEmail(rs.getString("email"));
                bean.setZipcode(rs.getString("zipcode"));
                bean.setAddress(rs.getString("address"));
                String hobbys[] = new String[5];
                String hobby = rs.getString("hobby");
                for (int i = 0; i < hobbys.length; i++) {
                    hobbys[i] = hobby.substring(i, i + 1);
                }
                bean.setHobby(hobbys);
                bean.setJob(rs.getString("job"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 연결 해제
            pool.freeConnection(con);
        }
        return bean;
    }

    // 회원 정보 수정 메서드
    public boolean updateMember(MemberBean bean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            // 데이터베이스 연결
            con = pool.getConnection();
            String sql = "update tblMember set pwd=?, name=?, gender=?, birthday=?,"
                    + "email=?, zipcode=?, address=?, hobby=?, job=? where id = ?";
            pstmt = con.prepareStatement(sql);
            // 쿼리에 파라미터 설정
            pstmt.setString(1, bean.getPwd());
            pstmt.setString(2, bean.getName());
            pstmt.setString(3, bean.getGender());
            pstmt.setString(4, bean.getBirthday());
            pstmt.setString(5, bean.getEmail());
            pstmt.setString(6, bean.getZipcode());
            pstmt.setString(7, bean.getAddress());
            char hobby[] = { '0', '0', '0', '0', '0' };
            if (bean.getHobby() != null) {
                String hobbys[] = bean.getHobby();
                String list[] = { "음악감상", "영화감상", "등산", "운동", "요리" };
                for (int i = 0; i < hobbys.length; i++) {
                    for (int j = 0; j < list.length; j++)
                        if (hobbys[i].equals(list[j]))
                            hobby[j] = '1';
                }
            }
            pstmt.setString(8, new String(hobby));
            pstmt.setString(9, bean.getJob());
            pstmt.setString(10, bean.getId());
            // 쿼리 실행 결과 확인
            int count = pstmt.executeUpdate();
            if (count > 0)
                flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 연결 해제
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
}
