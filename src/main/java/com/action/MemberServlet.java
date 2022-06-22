package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class MemberServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public MemberServlet() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        HttpSession session = request.getSession();
        ComBean cBean = new ComBean();
        PrintWriter out = response.getWriter();
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
        String date2 = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        String method = request.getParameter("method");
        if (method.equals("mreg")) { //用户注册
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String tel = request.getParameter("tel");
            String address = request.getParameter("address");
            if (username.equals("admin")) {
                request.setAttribute("message", "非法的用户名！");
                request.getRequestDispatcher("reg.jsp").forward(request, response);
            } else {
                String str = cBean.getString("select id from user where username='" + username + "'");
                if (str == null) {
                    int flag = cBean.comUp("insert into user(username,password,time,sex,age,tel,address,owner,imgsrc) " +
                            "values('" + username + "','" + password + "','" + date + "','" + sex + "','" + age + "','" + tel + "','" + address + "','用户','pic/nobody.jpg')");
                    int flag1 = cBean.comUp("insert into jifen(username,jifen,time) values('" + username + "','" + 0 + "','" + date + "')");
                    if (flag == Constant.SUCCESS && flag1 == Constant.SUCCESS) {
                        request.setAttribute("message", "注册成功请登录！");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "操作失败！");
                        request.getRequestDispatcher("reg.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "该用户名已存在！");
                    request.getRequestDispatcher("reg.jsp").forward(request, response);
                }
            }
        } else if (method.equals("mupreg")) { //用户修改注册资料
            String member = (String) session.getAttribute("user");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String tel = request.getParameter("tel");
            String address = request.getParameter("address");
            String imgsrc = request.getParameter("imgsrc");
            int flag = cBean.comUp("update user set sex='" + sex + "',age='" + age + "'," +
                    "tel='" + tel + "',address='" + address + "',imgsrc='pic/" + imgsrc + "' where username='" + member + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("member/info/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("member/info/index.jsp").forward(request, response);
            }
        } else if (method.equals("mlogin")) {//用户登录 代码
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String str = cBean.getString("select id from user where username='" + username + "' and password='" + password + "'");
            if (str == null) {
                request.setAttribute("message", "登录信息错误！");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                session.setAttribute("user", username);
                session.setAttribute("coms", "member");
                out.print("<script>top.location.href='index.jsp'</script>");
//					request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else if (method.equals("lost")) { //丢失密码
            String username = request.getParameter("username");
            String tel = request.getParameter("tel");
            String str = cBean.getString("select id from user where username='" + username + "' and tel='" + tel + "'");
            if (str == null) {
                request.setAttribute("message", "无此用户或已经被管理员停用！");
                request.getRequestDispatcher("lost.jsp").forward(request, response);
            } else {
                cBean.comUp("update user set password='111' where username='" + username + "'");
                request.setAttribute("message", "新密码为111，请登录后修改！");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if (method.equals("memberexit")) { //退出登录
            session.removeAttribute("user");
            session.removeAttribute("password");
            session.removeAttribute("sf");
            session.removeAttribute("coms");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (method.equals("muppwd")) {//用户修改密码
            String member = (String) session.getAttribute("member");
            String oldpwd = request.getParameter("oldpwd");
            String newpwd = request.getParameter("newpwd");
            String str = cBean.getString("select id from user where username='" + member + "' and  password='" + oldpwd + "'");
            if (str == null) {
                request.setAttribute("message", "原始密码信息错误！");
                request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response);
            } else {
                int flag = cBean.comUp("update user set password='" + newpwd + "' where username='" + member + "'");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("member/info/editpwd.jsp").forward(request, response);
                }
            }
        }
        /////////////////////////////管理员操作
        else if (method.equals("delm")) {//删除用户
            String id = request.getParameter("id");
            int flag = cBean.comUp("delete from user where id='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/member/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/member/index.jsp").forward(request, response);
            }
        }

    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occure
     */
    public void init() throws ServletException {
        // Put your code here
    }

}
