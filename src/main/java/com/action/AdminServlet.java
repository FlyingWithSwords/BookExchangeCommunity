package com.action;
/**
 * 管理员登陆 增加 修改 删除
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class AdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
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
		PrintWriter out = response.getWriter();
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2 = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		try {
			String method = request.getParameter("method").trim();
			ComBean cBean = new ComBean();
			HttpSession session = request.getSession();
			if (method.equals("one")) {//用户登录
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String sf = request.getParameter("sf");
				String str = cBean.getString("select id from user where username='" + username + "' and  password='" + password + "' and  owner='" + sf + "' ");
				if (str == null) {
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("admin/login.jsp").forward(request, response);
				} else {
					session.setAttribute("user", username);
					session.setAttribute("sf", sf);
					session.setAttribute("coms", "admin");
					out.print("<script>top.location.href='admin/index.jsp'</script>");
//						request.getRequestDispatcher("admin/index.jsp").forward(request, response);
				}
			} else if (method.equals("uppwd")) {//修改密码
				String username = (String) session.getAttribute("user");
				String oldpwd = request.getParameter("oldpwd");
				String newpwd = request.getParameter("newpwd");
				String str = cBean.getString("select id from user where username='" + username + "' and  password='" + oldpwd + "'");
				if (str == null) {
					request.setAttribute("message", "原始密码信息错误！");
					request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
				} else {
					int flag = cBean.comUp("update user set password='" + newpwd + "' where username='" + username + "'");
					if (flag == Constant.SUCCESS) {
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
					} else {
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
					}
				}
			} else if (method.equals("adminexit")) {//退出登录
				session.removeAttribute("user");
				session.removeAttribute("sf");
				session.removeAttribute("password");
				session.removeAttribute("coms");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else if (method.equals("addm")) {//增加系统用户
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");
				String address = request.getParameter("address");
				String owner = request.getParameter("owner");
				String str = cBean.getString("select id from user where username='" + username + "'");
				if (str == null) {
					int flag = cBean.comUp("insert into user(username,password,time,sex,age,tel,address,owner,imgsrc) " +
							"values('" + username + "','" + password + "','" + date + "','" + sex + "','" + age + "','" + tel + "','" + address + "','" + owner + "','pic/nobody.jpg')");
					if (flag == Constant.SUCCESS) {
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
					} else {
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
			} else if (method.equals("upm")) {//修改系统用户
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");
				String address = request.getParameter("address");
				int flag = cBean.comUp("update user set password='" + password + "',sex='" + sex + "',age='" + age + "'," +
						"tel='" + tel + "',address='" + address + "' where id='" + id + "'");
				if (flag == Constant.SUCCESS) {
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				} else {
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
			} else if (method.equals("delm")) {//删除系统用户
				String id = request.getParameter("id");
				int flag = cBean.comUp("delete from user where id='" + id + "'");
				if (flag == Constant.SUCCESS) {
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				} else {
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
			} else if (method.equals("upm2")) {//修改系统用户
				String id = request.getParameter("id");
				String username = request.getParameter("username");
				/* String username=(String)session.getAttribute("user"); */
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String tel = request.getParameter("tel");
				String address = request.getParameter("address");
				int flag = cBean.comUp("update user set username='" + username + "',sex='" + sex + "',age='" + age + "'," +
						"tel='" + tel + "',address='" + address + "' where id='" + id + "'");
				if (flag == Constant.SUCCESS) {
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/system/index2.jsp").forward(request, response);
				} else {
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/system/index2.jsp").forward(request, response);
				}
			} else {//无参数传入转到错误页面
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
