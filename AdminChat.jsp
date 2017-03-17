

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <%
            String userid = (String) session.getAttribute("ADMIN");

            String msg = (String) session.getAttribute("MSG");
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/menu.css" type="text/css"/>
        <link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
        <link rel="stylesheet" href="css/style-sheet.css" type="text/css"/>
        <title>Product</title>
    </head>
      <%@page import="java.sql.*" %>
    <body>
        <table  width="80%" align="center"  bgcolor="white">
            <tr  height="40px">
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                <%@include file="Adminheader_menu.html" %>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" width="100%" style="height:15px;" class="toplinls"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4" valign="top">
                                               <form action="onlineChatAgent" method="post">
                                    <table  align="center">


                                        <tr>
                                            <td class="text-1">
                                                User&nbsp;Name
                                            </td><td>


                                                <select name="cmbempid" id="cmbempid" style="width:37Px;">
                                                    <option value="na" selected> - - - - - Select - - - - </option>
                                                    <%
                                                                PreparedStatement pst2 = null;
                                                                Connection con2 = null;
                                                                ResultSet rst2 = null;
                                                                try {
                                                                    con2 = connection.connect.makeConnection();
                                                                    String query = "select UserName from userlogin";
                                                                    pst2 = con2.prepareStatement(query);
                                                                    rst2 = pst2.executeQuery();
                                                                    while (rst2.next()) {

                                                    %>
                                                    <option value="<%=rst2.getString(1)%>"><%=rst2.getString(1)%></option>

                                                    <%
                                                                    }
                                                                } catch (Exception e) {
                                                                    e.printStackTrace();
                                                                }
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td height="15%" size="20"colspan="2">
                                                <div id="ReloadThis" style="border-style: outset;border: 1px solid gray;height: 130px;width: 180px;overflow: auto;">

                                                    <%     Statement st = null;
                                                                Connection conn = null;
                                                                ResultSet result = null;
                                                                conn =connection.connect.makeConnection();;

                                                                try {
                                                                   String query = "select id,mess from chatting where sid='" + userid + "'";
                                                                    System.out.println("query is " + query);
                                                                    st = conn.createStatement();
                                                                    result = st.executeQuery(query);

                                                    %>

                                                    <%
                                                                                                                            while (result.next()) {

                                                                                                                                String name = result.getString(1);
                                                                                                                                String message = result.getString(2);


                                                    %>
                                                    <span style="font-size: 12px;color: green;font-weight: bold;"><%=name%></span>
                                                    &nbsp;:&nbsp;<span style="font-size: 12px;color: black;font-weight: bold;"><%=message%></span><br/>

                                                    <%
                                                                                                                            }
                                                    %>

                                                    <%
                                                                    st.close();
                                                                    conn.close();
                                                                } catch (Exception e) {
                                                                }

                                                    %>

                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><input type="text" name="txtmessage" id="txtmessage" size="20"></td>
                                            <td>
                                                <input type="hidden" name="txtid" id="txtid" value="<%=userid%>">

                                            </td>
                                            <td>
                                                <input type="submit" name="btnsubmit" id="btnsubmit" value="Send"/>
                                            </td>
                                        </tr>


                                    </table>
                                </form>
                </td>
            </tr>
            <tr>
                <td height="50" colspan="2" align="center" class="toplinls" width="100%">
                    <span class="whitefont">Online Mall Shopping</span>
                </td>
            </tr>
        </table>
    </body>
</html>
