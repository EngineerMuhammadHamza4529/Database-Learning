<?php
include 'db.php'; // Include database connection

// Retrieve categories for dropdown
$sql = "SELECT id, name FROM categories";
$result = mysqli_query($conn, $sql);

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $category_id = mysqli_real_escape_string($conn, $_POST['category']);

    // Image upload handling
    $target_dir = "uploads/Images/";
    $target_file = $target_dir . basename($_FILES['image']['name']);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if image file is a actual image or fake image
    $check = getimagesize($_FILES['image']['tmp_name']);
    if ($check === false) {
        echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>File is not an image.</div></div>";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES['image']['size'] > 500000) { // 500KB limit
        echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, your file is too large.</div></div>";
        $uploadOk = 0;
    }

    // Allow certain file formats
    $allowed_types = array('jpg', 'jpeg', 'png', 'gif');
    if (!in_array($imageFileType, $allowed_types)) {
        echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, only JPG, JPEG, PNG & GIF files are allowed.</div></div>";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, your file was not uploaded.</div></div>";
    } else {
        // Upload file if all checks are passed
        if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
            $image = basename($_FILES['image']['name']);

            // Insert into database
            $sql = "INSERT INTO products (category_id, name, description, price, image) VALUES ('$category_id', '$name', '$description', '$price', '$image')";

            if (mysqli_query($conn, $sql)) {
                header("Location: view_product.php");
                exit();
            } else {
                echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Error: " . mysqli_error($conn) . "</div></div>";
            }
        } else {
            echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, there was an error uploading your file.</div></div>";
            exit();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <?php include 'links.php'; ?>
    <style>
        /* Optional: Custom CSS */
        .form-group {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Add New Product</h2>
        <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" cols="50" class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="category">Select Category:</label>
                <select id="category" name="category" class="form-control" required>
                    <?php while ($row = mysqli_fetch_assoc($result)): ?>
                        <option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="image">Product Image:</label>
                <input type="file" id="image" name="image" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </div>
    <?php include 'footer.php'; ?>
</body>
</html>

<?php
// Close the database connection
mysqli_close($conn);
?>
