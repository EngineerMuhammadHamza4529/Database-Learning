<?php
// Include your database connection file
include 'db.php';

// Initialize variable to store category ID
$id = '';

// Check if category ID is provided in the URL
if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // Delete category from the database
    $sql = "DELETE FROM categories WHERE id = '$id'";

    if (mysqli_query($conn, $sql)) {
        // Redirect to view categories page after successful deletion
        header("Location: view_category.php");
        exit();
    } else {
        // Handle database errors
        die("Error deleting category: " . mysqli_error($conn));
    }
} else {
    // Redirect to error page or handle accordingly if category ID is not provided
    die("Category ID not provided.");
}

// Close the database connection
mysqli_close($conn);
?>
