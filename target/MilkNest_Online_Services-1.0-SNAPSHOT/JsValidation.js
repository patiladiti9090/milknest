/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//USERNAME
function validationUsername(str) {

    if (str === null || str === "") {
        var id1 = document.getElementById('Usernamevalidationerror');
        id1.innerHTML = "Required";
        id1.style.color = "red";
    } else {
        document.getElementById('Usernamevalidationerror').innerHTML = "";
    }
}

//Password Validation
function passwordValidation(str, id) {

    var expression = /^(?=.\d)(?=.[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20}$/;
    var validate = expression.test(str);
    if (validate === false) {

        var id1 = document.getElementById(id);
        id1.innerHTML = "Invalid Password";
        id1.style.color = "red";
    } else {
        var id1 = document.getElementById(id);
        id1.innerHTML = "";
        }
}

//MobileNo Validation
function mobileValidation(str, id) {

    if (str.length > 10 || str.length < 10) {

        var id1 = document.getElementById(id);
        id1.innerHTML = "Invalid mobile";
        id1.style.color = "red";
    } else {
        var id1 = document.getElementById(id);
        id1.innerHTML = "";
    }
}

//Email-ID
function emailValidation(str) {
    var expression = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var validate = expression.test(str);
    if (validate === false) {

        var id1 = document.getElementById('errormessageemail');
        id1.innerHTML = "Invalid Email";
        id1.style.color = "red";
    } else {
        var id1 = document.getElementById('errormessageemail');
        id1.innerHTML = "";
    }
    // Validation function for all fields
    function validateForm() {
        // Get form field values
        const username = document.getElementById("username").value.trim();
        const password = document.getElementById("password").value.trim();
        const contactNo = document.getElementById("contactno").value.trim();
        const email = document.getElementById("exampleInputEmail1").value.trim();

        // Check if any field is empty
        if (username === "") {
            alert("Username is required.");
            return false; // Prevent form submission
        }

        if (password === "") {
            alert("Password is required.");
            return false; // Prevent form submission
        }

        if (contactNo === "") {
            alert("Contact No is required.");
            return false; // Prevent form submission
        }

        if (email === "") {
            alert("Email ID is required.");
            return false; // Prevent form submission
        }

        // Check if contact number is numeric and 10 digits
        const contactNoPattern = /^\d{10}$/;
        if (!contactNoPattern.test(contactNo)) {
            alert("Please enter a valid 10-digit contact number.");
            return false; // Prevent form submission
        }

        // Check if email is valid
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false; // Prevent form submission
        }

        return true; // Allow form submission
    }

}
