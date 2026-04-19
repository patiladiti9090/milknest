<%@page import="java.util.ArrayList"%>
<%@page import="com.milknest.milknest_online_services.Cart"%>
<%@page import="com.milknest.milknest_online_services.Payment"%>

<%
Integer userId = (Integer) session.getAttribute("userId");

if(userId == null){
    response.sendRedirect("Login.jsp");
    return;
}

String paymentMode = request.getParameter("paymentMode");

ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart");

if(cartList == null || cartList.isEmpty()){
    out.println("Cart is empty!");
    return;
}

double total = 0;
for(Cart c : cartList){
    total += c.getPrice();
}

Payment p = new Payment();

p.setPaymentname("MilkNest Order");
p.setPaymentdate(java.time.LocalDate.now().toString());
p.setPaymentmode(paymentMode);
p.setPaymenttotalamount((int)total);
p.setQty(cartList.size());
p.setDiscount(0);
p.setNetamount((int)total);
p.setCustomerID(userId);

boolean status = p.insertPayment(p);

if(status){

    session.setAttribute("lastTotal", total);
    session.setAttribute("paymentMode", paymentMode);

    session.removeAttribute("cart");

    response.sendRedirect("Receipt.jsp");

}else{
%>
<script>
alert("Payment Failed");
window.location="Payment.jsp";
</script>
<%
}
%>