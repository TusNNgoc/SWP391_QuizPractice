<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Role</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div>
            <label>Hiện 
                <form>
                    <select id="quantitySelect" name="length" onchange="changeQuantity(this)" aria-controls="sampleTable" class="form-control form-control-sm">
                        <option value="5" <c:if test="${quantity == 5}">selected</c:if>>5</option>
                        <option value="10" <c:if test="${quantity == 10}">selected</c:if>>10</option>
                        <option value="25" <c:if test="${quantity == 25}">selected</c:if>>25</option>
                        <option value="50" <c:if test="${quantity == 50}">selected</c:if>>50</option>
                        </select> danh mục
                    </form>
                </label>
                <script>
                    function changeQuantity(selectElement) {
                        var selectedValue = selectElement.value;

                        // Create a form element
                        var form = document.createElement('form');
                        form.method = 'get';
                        form.action = 'role'; // Set the URL of your servlet

                        // Create an input element to hold the selected value
                        var input = document.createElement('input');
                        input.type = 'hidden'; // Hidden input field
                        input.name = 'quantity'; // Name should match the parameter name in your servlet
                        input.value = selectedValue;
                        // Create an input element for the name
                        var nameInput = document.createElement('input');
                        nameInput.type = 'hidden';
                        nameInput.name = 'name'; // Set the name to 'name'
                        nameInput.value = '${name}'; // Set the value to the desired name
                        // Create an input element for the carID

                        form.appendChild(input);
                        form.appendChild(nameInput);
                        document.body.appendChild(form);

                        // Submit the form
                        form.submit();
                    }
            </script>  
        </div>
        <div>
            <form action="role" method="get">
                <div class="search-box">
                    <label>
                        Tìm kiếm:<input type="search" value="${name}" name="name" class="form-control form-control-sm" placeholder="Nhập từ khóa cần tìm " aria-controls="sampleTable">
                    </label>
                    <input type="hidden" name="index" value="1" />
                    <input type="hidden" name="quantity" value="${quantity}" />
                    <button type="submit" class="btn btn-outline-danger">Search</button>
                </div>
            </form>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addRoleModal">
            Add
        </button>

        <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
                <tr>
                    <th width="80px">Role id</th>
                    <th >Role name</th>
                    <th width="250px">Chức năng</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="role" items="${data}">
                    <tr>
                        <th>${role.role_id}</th>
                        <td>${role.role_name}
                            <div class="Container">
                                <div class="collapse" id="collapse${role.role_id}">
                                    <div class = row>
                                        <div class="col-sm">
                                            ID
                                        </div>
                                        <div class="col-sm">
                                            Fullname
                                        </div>
                                        <div class="col-sm">
                                            Username
                                        </div>
                                        <div class="col-sm">
                                            Email
                                        </div>
                                    </div>

                                    <c:forEach begin="0" end="${size}" var="user" items="${userlist}">
                                        <!-- Loop body -->
                                        <c:if test="${role.role_id == user.role.role_id}">
                                            <div class="row">
                                                <div class="col-sm">
                                                    ${user.user_id}
                                                </div>
                                                <div class="col-sm">
                                                    ${user.fullname}
                                                </div>
                                                <div class="col-sm">
                                                    ${user.username}
                                                </div>
                                                <div class="col-sm">
                                                    ${user.email}
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                </div>
                            </div>
                        </td>
                        <!-- Button trigger modal -->
                        <th>
                            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse${role.role_id}" aria-expanded="false" aria-controls="collapse${role.role_id}">
                                Users
                            </button>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal${role.role_id}">
                                Update
                            </button>

                            <a type="button" class="btn btn-primary" href="role?action=deleterole&roleid=${role.role_id}">Delete</a>
                        </th>
                    </tr>
                    <!-- Update Modal -->
                <div class="modal fade" id="updateModal${role.role_id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel${role.role_id}" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateModalLabel${role.role_id}">Update Role</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- Add form fields for updating role -->
                                <form action="role" method="POST">
                                    <div class="form-group">
                                        <label for="roleId">Role ID</label>
                                        <input type="text" class="form-control" id="roleId" name="roleid" value="${role.role_id}" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="roleName">Role Name</label>
                                        <input type="text" class="form-control" id="roleName" name="rolename" value="${role.role_name}">
                                    </div>
                                    <input type="hidden" name="action" value="updaterole"/>
                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </tbody>
    </table>
    <div class="dataTables_paginate">
        <c:choose>

            <c:when test = "${count>0}">
                Hiện ${(index-1)*quantity+1} đến 
                ${((index*quantity+1)>count) ? count : index*quantity}
                của ${count} danh mục
            </c:when>

            <c:otherwise>
                Không tìm thấy!
            </c:otherwise>
        </c:choose>
        <ul class="pagination justify-content-center">

            <li class="paginate_button page-item previous <c:if test="${index == 1}">disabled</c:if>" id="sampleTable_previous">
                <a href="role?index=${index -1}&name=${name}&quantity=${quantity}" class="page-link">Lùi</a>
            </li>

            <c:forEach begin="1" end="${endPage}" var="i">

                <li class="paginate_button page-item ${index == i ? 'active' : ''}">
                    <a href="role?index=${i}&name=${name}&quantity=${quantity}" class="page-link">${i}</a>
                </li>

            </c:forEach>

            <li class="paginate_button page-item next <c:if test="${index == endPage}">disabled</c:if>" id="sampleTable_next">
                <a href="role?index=${index +1}&name=${name}&quantity=${quantity}" class="page-link">Tiếp</a>
            </li>

        </ul>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="addRoleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addRoleModalLabel">Add Role</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <!-- Your form inputs go here -->
                <form action="role" method="GET">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="rolename">Role Name</label>
                            <input type="text" class="form-control" id="roleName" placeholder="Enter role name" name="rolename">
                        </div>
                    </div>
                    <!-- Add more form inputs as needed -->
                    <input type="hidden" name="action" value="addrole"/>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>                        
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
