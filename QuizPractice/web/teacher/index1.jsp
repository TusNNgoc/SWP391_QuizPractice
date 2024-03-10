<%-- 
    Document   : index1.jsp
    Created on : Mar 2, 2024, 5:18:45 PM
    Author     : -Pc-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/index1.css">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
    <body>
        <div class="container mt-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-10">
                    <div class="rounded">
                        <div class="table-responsive table-borderless">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="text-center">
                                            <div class="toggle-btn">
                                                <div class="inner-circle"></div>
                                            </div>
                                        </th>
                                        <th>Order #</th>
                                        <th>Company name</th>
                                        <th>status</th>
                                        <th>Total</th>
                                        <th>Created</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody class="table-body">
                                    <tr class="cell-1">
                                        <td class="text-center">
                                            <div class="toggle-btn">
                                                <div class="inner-circle"></div>
                                            </div>
                                        </td>
                                        
                                        <td><span class="badge badge-success">Fullfilled</span></td>
                                       
                                    </tr>
                                    <tr class="cell-1">
                                        <td class="text-center">
                                            <div class="toggle-btn">
                                                <div class="inner-circle"></div>
                                            </div>
                                        </td>
                                        <td>#SO-13453</td>
                                        <td>Aartsen van</td>
                                        <td><span class="badge badge-info">Confirmed</span></td>
                                        <td>$3454.00</td>
                                        <td>Yesterday</td>
                                        <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                    </tr>
                                    <tr class="cell-1">
                                        <td class="text-center">
                                            <div class="toggle-btn">
                                                <div class="inner-circle"></div>
                                            </div>
                                        </td>
                                        <td>#SO-13498</td>
                                        <td>Trashes Habard</td>
                                        <td><span class="badge badge-danger">Partially shipped</span></td>
                                        <td>$6274.00</td>
                                        <td>May 12,2020</td>
                                        <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                    </tr>
                                    <tr class="cell-1">
                                        <td class="text-center">
                                            <div class="toggle-btn">
                                                <div class="inner-circle"></div>
                                            </div>
                                        </td>
                                        <td>#SO-16499</td>
                                        <td>Samban Hubart</td>
                                        <td><span class="badge badge-success">Fullfilled</span></td>
                                        <td>$6375.00</td>
                                        <td>May 11,2020</td>
                                        <td><i class="fa fa-ellipsis-h text-black-50"></i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>$(document).ready(function () {

                $('.toggle-btn').click(function () {
                    $(this).toggleClass('active').siblings().removeClass('active');
                });

            });</script>
    </body>
</html>
