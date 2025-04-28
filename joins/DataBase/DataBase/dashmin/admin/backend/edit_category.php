<?php
// Include your database connection file
include 'db.php';

// Initialize variables to store category data
$id = $name = $description = '';
$errors = array();

// Check if category ID is provided in the URL
if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // Retrieve category data from the database
    $sql = "SELECT * FROM categories WHERE id = '$id'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        $name = $row['name'];
        $description = $row['description'];
    } else {
        // Redirect to error page or handle accordingly if category not found
        die("Category not found.");
    }
}

// Handle form submission to update category
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validate and sanitize inputs
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);

    // Update category in the database
    $sql = "UPDATE categories SET name = '$name', description = '$description' WHERE id = '$id'";

    if (mysqli_query($conn, $sql)) {
        // Redirect to view categories page after successful update
        header("Location: view_category.php");
        exit();
    } else {
        // Handle database errors
        $errors[] = "Error updating category: " . mysqli_error($conn);
    }
}

// Close the database connection
mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Category</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'links.php'; ?>
</head>

<body>
    <div class="container">
        <h2>Edit Category</h2>
        <?php
        // Display errors, if any
        if (!empty($errors)) {
            echo '<div class="alert alert-danger" role="alert">';
            foreach ($errors as $error) {
                echo $error . '<br>';
            }
            echo '</div>';
        }
        ?>
        <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"] . "?id=" . $id); ?>">
            <div class="mb-3">
                <label for="name" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="name" name="name" value="<?php echo htmlspecialchars($name); ?>" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3"><?php echo htmlspecialchars($description); ?></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Category</button>
            <a href="view_category.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>

</html>
