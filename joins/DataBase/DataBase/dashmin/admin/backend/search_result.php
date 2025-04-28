<?php
include 'db.php'; // Include your database connection

// Initialize variables
$search = mysqli_real_escape_string($conn, $_GET['search'] ?? '');
$category = mysqli_real_escape_string($conn, $_GET['category'] ?? '');

// Build the SQL query
$sql = "SELECT p.id, p.name AS product_name, p.description, p.price, p.image, c.name AS category_name
        FROM products p
        INNER JOIN categories c ON p.category_id = c.id
        WHERE 1"; // Base query

// Add conditions based on search and filter inputs
if (!empty($search)) {
    $sql .= " AND (p.name LIKE '%$search%' OR p.description LIKE '%$search%')";
}
if (!empty($category)) {
    $sql .= " AND p.category_id = '$category'";
}

// Execute the query
$result = mysqli_query($conn, $sql);

// Handle the search results
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        // Display results as needed
        echo "<div>";
        echo "<h3>" . htmlspecialchars($row['product_name']) . "</h3>";
        echo "<p>" . htmlspecialchars($row['description']) . "</p>";
        echo "<p>Price: $" . htmlspecialchars($row['price']) . "</p>";
        echo "<p>Category: " . htmlspecialchars($row['category_name']) . "</p>";
        echo "<img src='uploads/Images/" . htmlspecialchars($row['image']) . "' width='100'>";
        echo "</div>";
    }
} else {
    echo "No products found.";
}

// Close the database connection
mysqli_close($conn);
?>
