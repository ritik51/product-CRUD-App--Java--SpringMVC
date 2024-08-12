<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp" %>
<script>

function checkForm() {
    var name = document.getElementById("name").value;
    var description = document.getElementById("description").value;
    var price = document.getElementById("price").value;

    if (!name && !description && !price) {
        alert("Please fill in all fields.");
        return false; // Prevent form submission
    } else {
        var messages = [];
        if (!name) {
            messages.push("Please enter a name.");
        }
        if (!description) {
            messages.push("Please enter a description.");
        }
        if (!price) {
            messages.push("Please enter a price.");
        }
        if (messages.length > 0) {
            alert(messages.join("\n"));
            return false; // Prevent form submission
        }
    }
    return true; // Allow form submission
}
/*
function checkform() {
	var nameVal = $("name").val();
	alert(nameval);
} 

*/
function checkNameLength() {
    var name = document.getElementById("name").value;
    if (name.length > 255) {
        document.getElementById("nameWarning").innerText = "Product name should not exceed 255 characters.";
        document.getElementById("submitBtn").disabled = true;
    } else {
        document.getElementById("nameWarning").innerText = "";
        document.getElementById("submitBtn").disabled = false;
    }
}


function checkDescriptionLength() {
    var description = document.getElementById("description").value;
    if (description.length > 255) {
        document.getElementById("descriptionWarning").innerText = "Product description should not exceed 255 characters.";
        document.getElementById("submitBtn").disabled = true;
    } else {
        document.getElementById("descriptionWarning").innerText = "";
        document.getElementById("submitBtn").disabled = false;
    }
}


function checkPriceLength() {
    var price = document.getElementById("price").value;
    if (!(/^\d+$/.test(price))) {
        document.getElementById("priceWarning").innerText = "Please enter an integer value only.";
        document.getElementById("submitBtn").disabled = true;
    } else if (price.length > 19) {
        document.getElementById("priceWarning").innerText = "Enter a number with less than 20 digits.";
        document.getElementById("submitBtn").disabled = true;
    } else {
        document.getElementById("priceWarning").innerText = "";
        document.getElementById("submitBtn").disabled = false;
    }
}



</script>
</head>
<body>

<div class="container mt-3">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h1 class="text-center mb-3">Fill the product detail</h1>

            <form action="handle-product" method="post"  onsubmit="return checkForm();"> 
                
                <div class="form-group">
                    <label for="name">Product Name</label> 
                    <input type="text" 
                    class="form-control" 
                    id="name" 
                    aria-describedby="emailHelp" 
                    name="name" 
                    placeholder="Enter the product name here" 
                     
                    oninput="checkNameLength()">
                <small id="nameWarning" class="text-danger"></small>
                </div>
                
                <div class="form-group">
                    <label for="description">Product Description</label>
                    <textarea class="form-control" 
                    name="description" 
                    id="description" 
                    rows="5" 
                    placeholder="Enter the product description" 
                    oninput="checkDescriptionLength()"></textarea>
                    <small id="descriptionWarning" class="text-danger"></small>
                </div> 
                
                <div class="form-group">
                    <label for="price">Product Price</label> 
                    <input type="text" 
                    placeholder="Enter Product Price" 
                    name="price" 
                    class="form-control" 
                    id="price" 
                    oninput="checkPriceLength()">
                    <small id="priceWarning" class="text-danger"></small>
                </div>
                
                <div class="container text-center">
                    <a href="${pageContext.request.contextPath }/"
                    class="btn btn-outline-danger">Back</a>
                    <button type="submit" id="submitBtn" class="btn btn-primary">Add</button>
                </div>
                
            </form>
                
        </div>
    </div>
</div>

</body>
</html>
