<?php
// Include database connection
include 'db.php';

// Initialize variables
$search_keyword = "";
$filter_by = "";

// Process search and filter parameters
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    // Sanitize search keyword
    $search_keyword = isset($_GET['search_keyword']) ? mysqli_real_escape_string($conn, $_GET['search_keyword']) : '';

    // Filter by option
    $filter_by = isset($_GET['filter_by']) ? $_GET['filter_by'] : '';

    // Construct SQL query
    $sql = "SELECT p.id, p.name AS product_name, p.description, p.price, p.image, c.name AS category_name
            FROM products p
            INNER JOIN categories c ON p.category_id = c.id
            WHERE 1";

    // Add search condition
    if (!empty($search_keyword)) {
        $sql .= " AND (p.name LIKE '%$search_keyword%' OR p.description LIKE '%$search_keyword%')";
    }

    // Add filter condition
    if (!empty($filter_by)) {
        if ($filter_by == 'name') {
            $sql .= " ORDER BY p.name ASC";
        } elseif ($filter_by == 'price') {
            $sql .= " ORDER BY p.price ASC";
        }
    }

    // Execute SQL query
    $result = mysqli_query($conn, $sql);

    // Check if query was successful
    if (!$result) {
        die("Error retrieving products: " . mysqli_error($conn));
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Products (Admin)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'links.php'; ?>
    <style>
        /* Optional: Custom CSS */
        .container {
            padding-top: 50px;
        }
        .btn-container {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>View Products</h2>
        <div class="mb-4">
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="GET" class="form-inline">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <input type="text" name="search_keyword" class="form-control" placeholder="Search by name or description" value="<?php echo htmlspecialchars($search_keyword); ?>">
                    </div>
                    <div class="col-md-4 mb-3">
                        <select name="filter_by" class="form-control">
                            <option value="">Filter by...</option>
                            <option value="name" <?php echo ($filter_by == 'name') ? 'selected' : ''; ?>>Name</option>
                            <option value="price" <?php echo ($filter_by == 'price') ? 'selected' : ''; ?>>Price</option>
                        </select>
                    </div>
                    <div class="col-md-2 mb-3">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Image</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (isset($result) && mysqli_num_rows($result) > 0): ?>
                        <?php while ($row = mysqli_fetch_assoc($result)): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['id']); ?></td>
                                <td><?php echo htmlspecialchars($row['product_name']); ?></td>
                                <td><?php echo htmlspecialchars($row['description']); ?></td>
                                <td>$<?php echo htmlspecialchars($row['price']); ?></td>
                                <td><?php echo htmlspecialchars($row['category_name']); ?></td>
                                <td><img src="uploads/Images/<?php echo htmlspecialchars($row['image']); ?>" width="50"></td>
                                <td class="btn-container">
                                    <a href="edit_product.php?id=<?php echo $row['id']; ?>" class="btn btn-primary btn-sm">Edit</a>
                                    <a href="delete_product.php?id=<?php echo $row['id']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="7">No products found</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

<?php
// Close the database connection
mysqli_close($conn);
?>
