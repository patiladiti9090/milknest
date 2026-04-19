<%
double total = (double) session.getAttribute("lastTotal");
String mode = (String) session.getAttribute("paymentMode");
%>

<!DOCTYPE html>
<html>
<head>
<title>Receipt</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body { background:#f1f8e9; }
.card {
    border-radius: 15px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.2);
}
</style>
</head>

<body>

<div class="container mt-5">
<div class="card p-4 text-center">

<h2 class="text-success">? Payment Successful</h2>
<hr>

<h4>Total Paid: ? <%=total%></h4>
<h5>Payment Mode: <%=mode%></h5>
<p>Date: <%=java.time.LocalDate.now()%></p>

<a href="Feedback.jsp" class="btn btn-primary mt-3">Give Feedback</a>

</div>
</div>

</body>
</html>