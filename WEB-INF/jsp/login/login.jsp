<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/taglibs.jsp" %>
<!-- For Mantis Issue 6099 -->
<jsp:useBean scope='session' id='userBean' class='org.akaza.openclinica.bean.login.UserAccountBean'/>
    <c:if test="${userBean.name!=''}">
    <c:redirect url="/MainMenu"/>
    </c:if>
<!-- End of 6099-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>OpenClinica</title>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
 <meta http-equiv="X-UA-Compatible" content="IE=8" />

<link rel="stylesheet" href="<c:url value='/includes/styles.css'/>" type="text/css"/>
<%-- <link rel="stylesheet" href="includes/styles2.css" type="text/css">--%>
<link rel="stylesheet" href="<c:url value='/includes/NewLoginStyles.css'/>" type="text/css"/>
<script type="text/JavaScript" language="JavaScript" src="<c:url value='/includes/jmesa/jquery.min.js'/>"></script>
<script type="text/JavaScript" language="JavaScript" src="<c:url value='/includes/jmesa/jquery-migrate-1.1.1.js'/>"></script>
<script type="text/javascript" language="JavaScript" src="<c:url value='/includes/jmesa/jquery.blockUI.js'/>"></script>
<%-- <script type="text/JavaScript" language="JavaScript" src="includes/global_functions_javascript2.js"></script> --%>
<script type="text/JavaScript" language="JavaScript" src="<c:url value='/includes/global_functions_javascript.js'/>"></script>
<script type="text/JavaScript" language="JavaScript" src="<c:url value='/includes/ua-parser.min.js'/>"></script>
</head>

<fmt:setBundle basename="org.akaza.openclinica.i18n.notes" var="restext"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.workflow" var="resworkflow"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.words" var="resword"/>
<fmt:setBundle basename="org.akaza.openclinica.i18n.format" var="resformat"/>

<%--<c:choose>--%>
    <%--<c:when test="${resword.locale == null}"><fmt:setLocale value="en" scope="session"/></c:when>--%>
    <%--<c:otherwise><fmt:setLocale value="${resword.locale}" scope="session"/></c:otherwise>--%>
<%--</c:choose>--%>

<body class="login_BG" onLoad="document.getElementById('username').focus();">
    <div class="login_BG">
    <center>

    <!-- OpenClinica logo -->
    <% String ua=request.getHeader("User-Agent"); String iev="" ; if (ua !=null && ua.contains("MSIE")) { int
        index=ua.indexOf("MSIE"); int endIndex=ua.indexOf(";", index); if (endIndex !=-1) { iev=ua.substring(index + 4,
        endIndex).trim(); } } boolean isIE=(iev.length()> 1 && Double.valueOf(iev) < 7); %>

            <center>
                <div class="flex-container">
                    <div id="OClogo"></div>
                    <p class="gandaki"><b>
                        स्वास्थ्य निर्देशनालय<br>
                        गण्डकी प्रदेश<br>
                        पोखरा, नेपाल</b>
                    </p>
                </div>
            </center>
    <!-- end OpenClinica logo -->
        <table width="720 px">

    <script type="text/javascript">
        var parser = new UAParser();
        var showMessage = false;

        if (parser.getBrowser().name == 'IE' && parseInt(parser.getBrowser().major) < 11){
            showMessage = true;
        }else if (parser.getBrowser().name != 'Firefox' && parser.getBrowser().name !='Chrome' && parser.getBrowser().name != 'IE'){
            showMessage = true;
        }

        if (showMessage){
            document.write("<tr> <td align='center' ><h4>"+
                        " <fmt:message key="choose_browser" bundle="${restext}"/>"+
                        "</h4></td> </tr>");
        }
    </script>
            </table>

            <table border="0" cellpadding="0" cellspacing="0" class="loginBoxes">
                <br/>
                <tr>
                    <td class="loginBox">
                        <div ID="loginBox">
                            <!-- Login box contents -->
                            <div ID="login">
                                <form action="<c:url value='/j_spring_security_check'/>" method="post">
                                    <h1><fmt:message key="login" bundle="${resword}"/></h1>
                                    <b><fmt:message key="user_name" bundle="${resword}"/></b>
                                    <div class="formfieldM_BG">
                                        <input type="text" id="username" name="j_username" class="formfieldM">
                                    </div>
                                    <b><fmt:message key="password" bundle="${resword}"/></b>
                                    <div class="formfieldM_BG">
                                        <input type="password" id="j_password" name="j_password" class="formfieldM" autocomplete="off">
                                    </div>
                                    <input type="submit" name="submit" value="<fmt:message key='login' bundle='${resword}'/>" class="loginbutton" />
                                    <a href="#" id="requestPassword"> <fmt:message key="forgot_password" bundle="${resword}"/></a>
                                </form>
                                <br/><jsp:include page="../login-include/login-alertbox.jsp"/>
                                <%-- <a href="<c:url value="/RequestPassword"/>"> <fmt:message key="forgot_password" bundle="${resword}"/></a> --%>
                            </div>
                            <!-- End Login box contents -->
                        </div>
                    </td>
                </tr>
            </table>
        <footer>
            <p>Powered by <b>OpenClinica</b><br> Upgraded/Customized by <b>Health Directorate, Gandaki Province</b></p>
        </footer>
    </center>

    <script type="text/javascript">
        document.getElementById('username').setAttribute( 'autocomplete', 'off' );
        document.getElementById('j_password').setAttribute( 'autocomplete', 'off' );

        jQuery(document).ready(function() {

        	jQuery.get("../../RssReader", function(data){
//                alert("Data Loaded: " + data);
                jQuery("#newsBox").html(data);
            });


            jQuery('#requestPassword').click(function() {
                jQuery.blockUI({ message: jQuery('#requestPasswordForm'), css:{left: "200px", top:"180px" } });
            });

            jQuery('#cancel').click(function() {
                jQuery.unblockUI();
                return false;
            });
        });

    </script>

        <div id="requestPasswordForm" style="display:none;">
              <c:import url="requestPasswordPop.jsp">
              </c:import>
        </div>

<!-- Footer -->
<!-- End Main Content Area -->
<jsp:include page="../login-include/login-footer.jsp"/>
