<%
String searchQuery = request.getParameter("query");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    DataAccess db = new DataAccess();
    con = db.getConnection();

    String sql = "SELECT * FROM tb_productsmaster WHERE productname LIKE ?";
    ps = con.prepareStatement(sql);
    ps.setString(1, "%" + searchQuery.trim() + "%");

    rs = ps.executeQuery();
%>

<div class="container mt-5">
    <h3>Search: <%=searchQuery%></h3>

    <div class="row">

<%
    boolean found = false;
    while(rs.next()){
        found = true;
%>

        <div class="col-md-3">
            <div class="card">
                <img src="<%=rs.getString("productImage")%>" height="200">
                <div class="card-body text-center">
                    <h5><%=rs.getString("productname")%></h5>
                    <p>?<%=rs.getDouble("productSaleprise")%></p>
                </div>
            </div>
        </div>

<%
    }

    if(!found){
%>
        <h4>No products found</h4>
<%
    }
%>

    </div>
</div>

<%
} catch(Exception e){
    out.println(e);
}
%>