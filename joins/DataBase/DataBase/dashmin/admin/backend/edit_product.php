<?php
include 'db.php'; // Include database connection

// Fetch product details to pre-fill the form
if (isset($_GET['id'])) {
    $product_id = $_GET['id'];
    $sql = "SELECT * FROM products WHERE id = $product_id";
    $result = mysqli_query($conn, $sql);
    $product = mysqli_fetch_assoc($result);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $product_id = $_POST['id'];
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $category_id = mysqli_real_escape_string($conn, $_POST['category']);

    // Image upload handling
    if ($_FILES['image']['name']) {
        $target_dir = "uploads/Images/";
        $target_file = $target_dir . basename($_FILES['image']['name']);
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        $uploadOk = 1;

        // Check if image file is a actual image or fake image
        $check = getimagesize($_FILES['image']['tmp_name']);
        if ($check !== false) {
            $uploadOk = 1;
        } else {
            echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>File is not an image.</div></div>";
            $uploadOk = 0;
        }

        // Check file size
        if ($_FILES['image']['size'] > 500000) { // 500KB limit
            echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, your file is too large.</div></div>";
            $uploadOk = 0;
        }

        // Allow certain file formats
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
            echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, only JPG, JPEG, PNG & GIF files are allowed.</div></div>";
            $uploadOk = 0;
        }

        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, your file was not uploaded.</div></div>";
        } else {
            if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
                $image = basename($_FILES['image']['name']);
            } else {
                echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Sorry, there was an error uploading your file.</div></div>";
                exit();
            }
        }
    } else {
        $image = $product['image'];
    }

    // Update the database
    $sql = "UPDATE products SET category_id='$category_id', name='$name', description='$description', price='$price', image='$image' WHERE id='$product_id'";

    if (mysqli_query($conn, $sql)) {
        header("Location: view_product.php");
        exit();
    } else {
        echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Error: " . mysqli_error($conn) . "</div></div>";
    }

    mysqli_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
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
        <h2>Edit Product</h2>
        <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<?php echo $product['id']; ?>">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" class="form-control" value="<?php echo $product['name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" cols="50" class="form-control"><?php echo $product['description']; ?></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" class="form-control" value="<?php echo $product['price']; ?>" required>
            </div>
            <div class="form-group">
                <label for="category">Select Category:</label>
                <select id="category" name="category" class="form-control" required>
                    <?php
                    $sql = "SELECT id, name FROM categories";
                    $categories = mysqli_query($conn, $sql);
                    while ($row = mysqli_fetch_assoc($categories)) {
                        $selected = ($row['id'] == $product['category_id']) ? "selected" : "";
                        echo "<option value='" . $row['id'] . "' $selected>" . $row['name'] . "</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="image">Product Image:</label>
                <input type="file" id="image" name="image" class="form-control">
                <?php if ($product['image']) : ?>
                    <img src="uploads/Images/<?php echo $product['image']; ?>" alt="Current Image" width="100">
                <?php endif; ?>
            </div>
            <button type="submit" class="btn btn-primary">Update Product</button>
        </form>
    </div>
</body>
</html>
