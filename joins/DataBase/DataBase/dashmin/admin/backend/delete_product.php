<?php
include 'db.php'; // Include database connection

if (isset($_GET['id'])) {
    $product_id = $_GET['id'];

    // Fetch the product image name to delete it from the server
    $sql = "SELECT image FROM products WHERE id = $product_id";
    $result = mysqli_query($conn, $sql);
    $product = mysqli_fetch_assoc($result);

    // Delete the product record from the database
    $sql = "DELETE FROM products WHERE id = $product_id";

    if (mysqli_query($conn, $sql)) {
        // Delete the image file from the server
        if ($product['image']) {
            $image_path = 'uploads/Images/' . $product['image'];
            if (file_exists($image_path)) {
                unlink($image_path); // Delete the image file
            }
        }
        header("Location: view_product.php"); // Redirect to view products page
        exit();
    } else {
        echo "<div class='container mt-3'><div class='alert alert-danger' role='alert'>Error: " . mysqli_error($conn) . "</div></div>";
    }
}

mysqli_close($conn);
?>
