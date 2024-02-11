package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title> Login</title>\n");
      out.write("    </head>\n");
      out.write("    ");


        if (request.getParameter("btn_login") != null) {
            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String selStudent = "select * from tbl_student where student_email='" + email + "'and student_password='" + password + "'";
            ResultSet rsStudent = con.selectCommand(selStudent);

            String selAdmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsAdmin = con.selectCommand(selAdmin);

            String selOfficer = "select * from tbl_electionofficer where officer_email='" + email + "' and officer_password='" + password + "'";
            ResultSet rsOfficer = con.selectCommand(selOfficer);

            if (rsStudent.next()) {
                session.setAttribute("sid", rsStudent.getString("student_id"));
                session.setAttribute("sname", rsStudent.getString("student_name"));
                response.sendRedirect("../Student/HomePage.jsp");
            } else if (rsAdmin.next()) {
                session.setAttribute("aid", rsAdmin.getString("admin_id"));
                session.setAttribute("aname", rsAdmin.getString("admin_name"));
                response.sendRedirect("../Admin/HomePage.jsp");
            } else if (rsOfficer.next()) {
                session.setAttribute("oid", rsOfficer.getString("officer_id"));
                session.setAttribute("oname", rsOfficer.getString("officer_name"));
                response.sendRedirect("../Officer/HomePage.jsp");
            } else {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert('Invalid');\n");
      out.write("    </script>\n");
      out.write("    ");

            }

        }

    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txt_email\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td><input type=\"password\" name=\"txt_password\"/></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\"><input type=\"submit\" name=\"btn_login\" value=\"Login\"/></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
