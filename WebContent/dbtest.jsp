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
        String sql = "select now()";
        DatabaseMetaData meta = conn.getMetaData();
        out.print("<b><i>Database URL : "+meta.getURL()+"</i></b><br><br>");
        out.println("\n=============\nDatabase Product Name is ... " + meta.getDatabaseProductName()+"<br>");
        out.println("\nDatabase Product Version is  " + meta.getDatabaseProductVersion()+"<br>");
        out.println("\n=============\nJDBC Driver Name is ........ " + meta.getDriverName()+"<br>");
        out.println("\nJDBC Driver Version is ..... " + meta.getDriverVersion()+"<br>");
        out.println("\nJDBC Driver Major Version is " + meta.getDriverMajorVersion()+"<br>");
        out.println("\nJDBC Driver Minor Version is " + meta.getDriverMinorVersion()+"<br>");
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
