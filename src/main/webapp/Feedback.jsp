<!DOCTYPE html>
<html>
<head>
<title>Feedback</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right,#fff3e0,#f3e5f5);
}

.card {
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,0.2);
}

.star {
    font-size:35px;
    cursor:pointer;
    color:lightgray;
    transition: 0.3s;
}

.star:hover,
.star.selected {
    color:gold;
}

textarea {
    resize:none;
}
</style>

<script>
function setRating(rating) {
    document.getElementById("rating").value = rating;

    let stars = document.querySelectorAll(".star");

    stars.forEach((star, index) => {
        if(index < rating){
            star.classList.add("selected");
        } else {
            star.classList.remove("selected");
        }
    });
}
</script>

</head>

<body>

<div class="container mt-5">
<div class="card p-4 text-center">

<h2 class="mb-3">* Rate Your Experience</h2>
<p>Select stars to rate</p>

<form action="SaveFeedback.jsp" method="post">

    <!-- Hidden rating -->
    <input type="hidden" name="rating" id="rating" required>

    <!-- ? Stars -->
    <div class="mb-3">
        <span class="star" onclick="setRating(1)">1</span>
        <span class="star" onclick="setRating(2)">2</span>
        <span class="star" onclick="setRating(3)">3</span>
        <span class="star" onclick="setRating(4)">4</span>
        <span class="star" onclick="setRating(5)">5</span>
    </div>

    <!-- Comment -->
    <textarea name="comment" class="form-control" placeholder="Write your feedback..." required></textarea>

    <!-- Submit -->
    <button type="submit" class="btn btn-success mt-3 px-4">Submit Feedback</button>

</form>

</div>
</div>

</body>
</html>