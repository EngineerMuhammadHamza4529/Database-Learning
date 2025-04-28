<?php
// Include your database connection file
include 'db.php';

// Initialize variables
$search_keyword = "";
$filter_by = "";

// Check if form submitted with search and filter parameters
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    // Sanitize search keyword
    $search_keyword = isset($_GET['search_keyword']) ? mysqli_real_escape_string($conn, $_GET['search_keyword']) : '';

    // Filter by option
    $filter_by = isset($_GET['filter_by']) ? $_GET['filter_by'] : '';

    // Prepare SQL query
    $sql = "SELECT id, name, description, image FROM categories WHERE 1";

    // Add search condition
    if (!empty($search_keyword)) {
        $sql .= " AND (name LIKE '%$search_keyword%' OR description LIKE '%$search_keyword%')";
    }

    // Add filter condition
    if (!empty($filter_by)) {
        if ($filter_by == 'name') {
            $sql .= " ORDER BY name ASC";
        } elseif ($filter_by == 'description') {
            $sql .= " ORDER BY description ASC";
        }
    }

    // Execute SQL query
    $result = mysqli_query($conn, $sql);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>View Categories (Admin)</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <?php include 'links.php'; ?>
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <?php include 'sidebar.php'; ?>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <?php include 'header.php'; ?>
            <!-- Navbar End -->

            <!-- View Categories Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded h-100 p-4">
                    <h2 class="mb-4">View Categories</h2>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="GET" class="mb-4">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <input type="text" name="search_keyword" class="form-control" placeholder="Search by name" value="<?php echo htmlspecialchars($search_keyword); ?>">
                            </div>
                            <div class="col-md-4 mb-3">
                                <select name="filter_by" class="form-control">
                                    <option value="">Filter by...</option>
                                    <option value="name" <?php echo ($filter_by == 'name') ? 'selected' : ''; ?>>Name</option>
                                    <option value="description" <?php echo ($filter_by == 'description') ? 'selected' : ''; ?>>Description</option>
                                </select>
                            </div>
                            <div class="col-md-2 mb-3">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>
                    </form>
                    <div class="table-responsive">
                        <table class="table">
                            <!-- Table headers remain unchanged -->
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (isset($result) && mysqli_num_rows($result) > 0) {
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        echo "<tr>";
                                        echo "<td>" . $row['id'] . "</td>";
                                        echo "<td>" . $row['name'] . "</td>";
                                        echo "<td>" . $row['description'] . "</td>";
                                        echo "<td><img src='" . $row['image'] . "' alt='" . $row['name'] . "' width='100'></td>";
                                        echo "<td>";
                                        echo "<a href='edit_category.php?id=" . $row['id'] . "' class='btn btn-primary btn-sm me-2'>Edit</a>";
                                        echo "<a href='delete_category.php?id=" . $row['id'] . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Are you sure you want to delete this category?\");'>Delete</a>";
                                        echo "</td>";
                                        echo "</tr>";
                                    }
                                } else {
                                    echo "<tr><td colspan='5'>No categories found</td></tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- View Categories End -->

            <!-- Footer Start -->
            <?php include 'footer.php'; ?>
            <!-- Footer End -->
        </div>
        <!-- Content End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>

<?php
// Close the database connection
mysqli_close($conn);
?>
