<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "java.sql.*,java.util.*" %>
<%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
        String url = "jdbc:mysql://mysql:3306/mydb";
        String id = "root";
        String pw = "root";
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(url,id,pw);
        String sql = "select name, unitprice from parts where name='part1'";
        DatabaseMetaData meta = conn.getMetaData();
        out.print("<b><i>Query("+sql+") Result</b><br><br>");
        pstmt = conn.prepareStatement(sql);
        pstmt.executeQuery();
            rs = pstmt.executeQuery();
            while (rs.next()){
                out.print(rs.getString(1));
            }
        }catch(Exception e){
        e.printStackTrace();
        }finally{
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
        }
%>
