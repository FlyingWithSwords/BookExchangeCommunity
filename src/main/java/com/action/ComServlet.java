package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
import com.util.DBO;

public class ComServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public ComServlet() {
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType(Constant.CONTENTTYPE);
        request.setCharacterEncoding(Constant.CHARACTERENCODING);
        HttpSession session = request.getSession();
        ComBean cBean = new ComBean();
        String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
        String date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
        String method = request.getParameter("method");
        String com = (session.getAttribute("coms") == null) ? "" : session.getAttribute("coms").toString();
        if (method.equals("addxw")) {  // 增加新闻公告
            String newscont = request.getParameter("newscont");
            String writer = request.getParameter("writer");
            String origin = request.getParameter("origin");
            String title = request.getParameter("title");
            String imgsrc = request.getParameter("imgsrc");
            if (newscont == null) newscont = "暂无";
            int flag = cBean.comUp("insert into news(newscont,writer,origin,time,title,imgsrc) values('" + newscont + "','" + writer + "','" + origin + "','" + date2 + "','" + title + "','images/" + imgsrc + "')");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
            }
        } else if (method.equals("upxw")) { //修改 新闻公告
            String id = request.getParameter("id");
            String newscont = request.getParameter("newscont");
            String writer = request.getParameter("writer");
            String origin = request.getParameter("origin");
            String title = request.getParameter("title");
            String imgsrc = request.getParameter("imgsrc");
            if (newscont == null) newscont = "暂无";
            int flag = cBean.comUp("update news set newscont='" + newscont + "',writer='" + writer + "',origin='" + origin + "',title='" + title + "',imgsrc='images/" + imgsrc + "' where nid='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
            }
        } else if (method.equals("delxw")) {//删除 新闻公告
            String id = request.getParameter("id");
            int flag = cBean.comUp("delete from news where nid='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/xw/index.jsp").forward(request, response);
            }
        } else if (method.equals("adddh")) {  // 增加对话
            String id = request.getParameter("id");
            String username = request.getParameter("username");
            String content = request.getParameter("content");
            String becaller = request.getParameter("becaller");
            String str = cBean.getString("select cid from communicate where cid='" + id + "'");
            if (str == null) {
                int flag = cBean.comUp("insert into communicate(username,content,time,becaller) values('" + username + "','" + content + "','" + date2 + "','" + becaller + "' )");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("admin/dh/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("admin/dh/index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "信息重复！");
                request.getRequestDispatcher("admin/dh/index.jsp").forward(request, response);
            }

        } else if (method.equals("updh")) { //修改 对话
            String id = request.getParameter("id");
            String username = request.getParameter("username");
            String content = request.getParameter("content");
            String becaller = request.getParameter("becaller");
            String str = cBean.getString("select cid from communicate where cid='" + id + "'");
            if (str != null) {
                int flag = cBean.comUp("update communicate set content='" + content + "',becaller='" + becaller + "',time='" + date2 + "' where cid='" + id + "'");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher(com + "/dh/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher(com + "/dh/index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "信息未发布成功！");
                request.getRequestDispatcher(com + "/dh/index.jsp").forward(request, response);
            }
        } else if (method.equals("deldh")) {//删除 对话
            String id = request.getParameter("id");
            int flag = cBean.comUp("delete from communicate where cid='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher(com + "/dh/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher(com + "/dh/index.jsp").forward(request, response);
            }
        } else if (method.equals("addjy")) {  //增加投诉
            String member = (String) session.getAttribute("user");
            String content = request.getParameter("content");
            int flag = cBean.comUp("insert into useradvise(username,content,time,admincon) values('" + member + "','" + content + "','" + date2 + "','" + "未回复" + "')");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("ts.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("ts.jsp").forward(request, response);
            }
        } else if (method.equals("upjy")) { //回复投诉
            String id = request.getParameter("id");
            String admincon = request.getParameter("admincon");
            String adminer = (String) session.getAttribute("user");
            int flag = cBean.comUp("update useradvise set admincon='" + adminer + ": " + admincon + "   [" + date2 + "]' where id='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/jy/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/jy/index.jsp").forward(request, response);
            }
        } else if (method.equals("deljy")) {//删除投诉
            String id = request.getParameter("id");
            int flag = cBean.comUp("delete from useradvise where id='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/jy/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/jy/index.jsp").forward(request, response);
            }
        } else if (method.equals("deljy2")) {//删除投诉
            String id = request.getParameter("id");
            int flag = cBean.comUp("delete from useradvise where id='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("member/jy/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("member/jy/index.jsp").forward(request, response);
            }
        } else if (method.equals("deljf")) {//删除 积分
            String id = request.getParameter("id");
            String del = request.getParameter("del");
            int flag = 0;
            List flist = cBean.getCom("select * from jifen where id='" + id + "'", 4);
            if (!flist.isEmpty()) {
                for (int i = 0; i < flist.size(); i++) {
                    List list1 = (List) flist.get(i);
                    flag = cBean.comUp("update jifen set jifen='" + ((Integer.parseInt(list1.get(2).toString()) - Integer.parseInt(del))) + "' where id='" + id + "'");
                }
            }
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("member/jf/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("member/jf/index.jsp").forward(request, response);
            }
        } else if (method.equals("deljf2")) {//删除 积分
            String id = request.getParameter("id");
            int flag = 0;
            flag = cBean.comUp("update jifen set jifen='0' where id='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher("admin/jf/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher("admin/jf/index.jsp").forward(request, response);
            }
        } else if (method.equals("addjf")) {  //增加积分   ***********代码注释
            String id = request.getParameter("id");
            String add = request.getParameter("add");
            String username = request.getParameter("username");
            String str = cBean.getString("select id from jifen where id='" + id + "'");
            if (str != null) {
                int flag = 0;
                List flist = cBean.getCom("select * from jifen where id='" + id + "'", 4);
                if (!flist.isEmpty()) {
                    for (int i = 0; i < flist.size(); i++) {
                        List list1 = (List) flist.get(i);
                        flag = cBean.comUp("update jifen set jifen='" + ((Integer.parseInt(list1.get(2).toString()) + Integer.parseInt(add))) + "' where id='" + id + "'");
                    }
                }
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("admin/jf/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("admin/jf/index.jsp").forward(request, response);
                }
            } else {
                int flag = cBean.comUp("insert into jifen(username,jifen,time) values('" + username + "','" + add + "','" + date2 + "')");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher("admin/jf/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher("admin/jf/index.jsp").forward(request, response);
                }
                /*
                 * request.setAttribute("message", "信息重复");
                 * request.getRequestDispatcher("admin/jf/index.jsp").forward(request,
                 * response);
                 */
            }
        } else if (method.equals("addbkxw")) {  // 增加图书信息
            String newscont = request.getParameter("newscont");
            String writer = request.getParameter("writer");
            String origin = request.getParameter("origin");
            String bkwriter = request.getParameter("bkwriter");
            String title = request.getParameter("title");
            String price = request.getParameter("price");
            String saleway = request.getParameter("saleway");
            String imgsrc = request.getParameter("imgsrc");
            if (newscont == null) newscont = "暂无";
            int flag = cBean.comUp("insert into booknews(newscont,writer,origin,bkwriter,time,title,booker,price,issaled,saleway,imgsrc) values('" + newscont + "','" + writer + "','" + origin + "','" + bkwriter + "','" + date2 + "','" + title + "','','" + price + "','待出售','" + saleway + "','images/" + imgsrc + "')");
            int flag1 = cBean.comUp("update jifen set jifen='10' where username='" + writer + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
            }
        } else if (method.equals("upbkxw")) {  //修改图书信息   ***********代码注释
            String id = request.getParameter("id");
            String newscont = request.getParameter("newscont");
            String writer = request.getParameter("writer");
            String origin = request.getParameter("origin");
            String bkwriter = request.getParameter("bkwriter");
            String title = request.getParameter("title");
            String price = request.getParameter("price");
            String issaled = request.getParameter("issaled");
            String saleway = request.getParameter("saleway");
            String imgsrc = request.getParameter("imgsrc");
            String str = cBean.getString("select bnid from booknews where bnid='" + id + "'");
            if (str != null) {
                int flag = cBean.comUp("update booknews set newscont='" + newscont + "',origin='" + origin + "',bkwriter='" + bkwriter + "',title='" + title + "',price='" + price + "',issaled='" + issaled + "',saleway='" + saleway + "',imgsrc='images/" + imgsrc + "' where bnid='" + id + "'");
                if (flag == Constant.SUCCESS) {
                    request.setAttribute("message", "操作成功！");
                    request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "操作失败！");
                    request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "信息不存在！");
                request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
            }
        } else if (method.equals("delbkxw")) {//删除图书信息
            String id = request.getParameter("id");
            int flag = cBean.comUp("delete from booknews where bnid='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher(com + "/bkxw/index.jsp").forward(request, response);
            }
        } else if (method.equals("addbuy")) {  // 增加购买信息
            String username = request.getParameter("username");
            String bnid = request.getParameter("bnid");
            String price = request.getParameter("price");
            String inf = request.getParameter("inf");
            int flag0 = cBean.getMessageCount("select * from usersell where bnid='" + bnid + "'");
            if (flag0 == -1) {
                int flag = cBean.comUp("insert into usersell(username,bnid,price,time) values('" + username + "','" + bnid + "','" + price + "','" + date2 + "' )");
                if (flag == Constant.SUCCESS) {
                    int flag1 = cBean.comUp("update booknews set issaled='已销售' where bnid='" + bnid + "'");
                    if (flag1 == Constant.SUCCESS) {
                        request.setAttribute("message", "操作成功！");
                        if (inf.equals("1")) {
                            request.getRequestDispatcher("bkxwinfo.jsp?id=" + bnid).forward(request, response);
                        } else {
                            request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
                        }
                    }
                } else {
                    request.setAttribute("message", "操作失败！");
                    if (inf.equals("1")) {
                        request.getRequestDispatcher("bkxwinfo.jsp?id=" + bnid).forward(request, response);
                    } else {
                        request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
                    }
                }
            } else {
                request.setAttribute("message", "操作失败！");
                if (inf.equals("1")) {
                    request.getRequestDispatcher("bkxwinfo.jsp?id=" + bnid).forward(request, response);
                } else {
                    request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
                }
            }

        } else if (method.equals("upbuy")) { //修改 购买信息
            String id = request.getParameter("id");
            String username = request.getParameter("username");
            String bnid = request.getParameter("bnid");
            String price = request.getParameter("price");
            int flag = cBean.comUp("update usersell set username='" + username + "',bnid='" + bnid + "',price='" + price + "' where id='" + id + "'");
            if (flag == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
            }
        } else if (method.equals("delbuy")) {//删除 购买信息
            String id = request.getParameter("id");
            String bnid = request.getParameter("bnid");
            int flag = cBean.comUp("delete from usersell where id='" + id + "'");
            int flag1 = cBean.comUp("update booknews set issaled='曾售出' where bnid='" + bnid + "'");
            if (flag == Constant.SUCCESS && flag1 == Constant.SUCCESS) {
                request.setAttribute("message", "操作成功！");
                request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "操作失败！");
                request.getRequestDispatcher(com + "/buy/index.jsp").forward(request, response);
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
