    <%@page import="Modelo.REUNIONES"%>
<%-- 
    Document   : ListaReuniones
    Created on : 08-ene-2020, 13:06:34
    Author     : Kevin Damian
--%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

HttpSession object= request.getSession(false);
if (object.getAttribute("usu")!=null && object.getAttribute("contra")!=null )
{
    
String usu=(String)object.getAttribute("usu");
String contra=(String)object.getAttribute("contra");

            

%>
<%
Modelo.DOCENTE car = new Modelo.DOCENTE();
        try {
            Connection con = Modelo.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement(" SELECT iddocente, nombres, apellidos, dni, foto FROM docente WHERE usuario=? AND contraseña =?");
            ps.setString(1, usu);
            ps.setString(2, contra);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               
                car.setIddodocente(rs.getInt(1));
                car.setNombres(rs.getString(2));
                car.setApellidos(rs.getString(3));
                 car.setDni(rs.getInt(4));
                car.setFoto(rs.getString(5));
                
                con.close();

            }
        } catch (SQLException ex) {

        }
        %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <title>FE Y ALEGRIA</title>
        <!-- Bootstrap Core CSS -->
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap responsive table CSS -->
        <link href="assets/plugins/tablesaw-master/dist/tablesaw.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="css/style.css" rel="stylesheet">
        <!-- You can change the theme colors from here -->
        <link href="css/colors/blue.css" id="theme" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>

    <body class="fix-header fix-sidebar card-no-border">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar">
                <nav class="navbar top-navbar navbar-expand-md navbar-light">
               
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse">
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav mr-auto mt-md-0">
                            <!-- This is  -->
                            <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                            <li class="nav-item m-l-10"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                          
                            
                        </ul>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav my-lg-0">
                        
                           <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<%=car.getFoto() %>" alt="user" class="profile-pic" /></a>
                            <div class="dropdown-menu dropdown-menu-right scale-up">
                               <ul class="dropdown-user">
                                    <li>
                                        <div class="dw-user-box">
                                            <div class="u-img"><img src="<%=car.getFoto() %>"  alt="user"  height="60" width="50"></div>
                                          
                                            <div class="u-text">
                                                <h4> <%=usu%> </h4>
                                                <h4> <%=contra%> </h4>
                                        
                                        </div>
                                    </li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href=""><i class="ti-user"></i> <%=car.getNombres() %>  </a></li>
                                    <li><a href=""><i class="ti-wallet"></i> <%=car.getApellidos()%> </a></li>
                                    <li><a href=""><i class="ti-email"></i> <%=car.getDni() %></a></li>
                                    <li role="separator" class="divider"></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="SERVLOGINDOCENTE?cerrar=true"><i class="fa fa-power-off"></i> Salir</a></li>
                                </ul>
                            </div>
                        </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- User profile -->
                    <div class="user-profile">
                        <!-- User profile image -->
                    <div class="profile-img"> <img src="assets/images/feyale.jpg"  alt="user"  height="60" width="50" />
                            <!-- this is blinking heartbit-->
                            <div class="notify setpos"> <span class="heartbit"></span> <span class="point"></span> </div>
                        </div>
                        <!-- User profile text-->
                    
                    </div>
                    <!-- End User profile text-->
                    <!-- Inicio Sidebar navigation -->
                    <%@include file="navegacionProfe.jsp" %>
                    <!-- Fin Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
                 <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Actualizar Reunion</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="IndexProfe.jsp">Inicio</a></li>
                        <li class="breadcrumb-item"><a href="ListaReuniones.jsp">Lista de Reuniones</a></li>
                        <li class="breadcrumb-item active">Actualizar Reunion</li>
                    </ol>
                </div>
                <div>
                    <button class="right-side-toggle waves-effect waves-light btn-inverse btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Actualizar Registro</h4>
                            </div>
                            <% String ca = request.getParameter("codi");%>
                                 <% Modelo.REUNIONES a = Modelo.REUNIONES.getCodreunionParaEditar(ca);%>
                            <div class="card-body">
                                <form method="post"  action="ServletmodificaReu" enctype="multipart/form-data">
                                    <div class="form-body">
                                        <h3 class="box-title">Información </h3>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input  hidden type="text" name="cod" 
                                           class="form-control"
                                           value="<% out.println(a.getIdreunion()); %>" readonly>
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Docente: <span class="text-danger">*</span></label>
                                                    
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" readonly name="docente" value="<% out.println(a.getIddocente()); %>">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Grado: <span class="text-danger">*</span></label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control form-control-danger" readonly name="grado" value="<% out.println(a.getIdgrado()); %>">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Descripcion: <span class="text-danger">*</span></label>
                                                    <div class="col-md-9">
                                                     <input type="text" class="form-control form-control-danger" name="des" value="<% out.println(a.getDescripcion()); %>">
                                                  </div>
                                            </div>
                                            <!--/span-->
                                            </div>
                                                  <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Archivo: <span class="text-danger">*</span></label>
                                                    <div class="col-md-9">
                                                        <input type="file" class="form-control" name="archivo" value="<% out.println(a.getArchivo()); %>">
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                            
                                    </div>
                                    <hr>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit"  value="Modificar" class="btn btn-success">Modificar</button>
                                                        <button type="button"  class="btn btn-inverse" onclick="window.location.href='ListaPadres.jsp'">Cancelar</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6"> 
                                                <h5><font color="red">
                                                    <%=request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : ""%>
                                                    </font></h5>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <%@include file="panelcolor.jsp" %>
                
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <%@include file="footer.jsp" %>
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
           

                <!-- ============================================================== -->
                <!-- End footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->
        </div>

        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="assets/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- slimscrollbar scrollbar JavaScript -->
        <script src="js/jquery.slimscroll.js"></script>
        <!--Wave Effects -->
        <script src="js/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/sidebarmenu.js"></script>
        <!--stickey kit -->
        <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
        <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
        <!--Custom JavaScript -->
        <script src="js/custom.min.js"></script>
        <!-- jQuery peity -->
        <script src="assets/plugins/tablesaw-master/dist/tablesaw.js"></script>
        <script src="assets/plugins/tablesaw-master/dist/tablesaw-init.js"></script>
        <!-- ============================================================== -->
        <!-- Style switcher -->
        <!-- ============================================================== -->
        <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
    </body>

</html>
 <% 
 } else {

  response.sendRedirect("loginprofe.jsp");
}
 
 %>