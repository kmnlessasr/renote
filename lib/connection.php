<?php
    $servername = "fdb33.awardspace.net";
    $username = "3942223_game";
    $password = "Karam.123";
    $dbname = "3942223_game";
    $table = "Students"; // lets create a table named Employees.

    // we will get actions from the app to do operations in the database...
    $action = $_POST["action"];
    // Create Connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check Connection
    if($conn->connect_error){
        die("Connection Failed: " . $conn->connect_error);
        return;
    }

    // If connection is OK...

    // If the app sends an action to create the table...
    if("CREATE_TABLE" == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table (
            universityNumber INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(30) NOT NULL,
            university VARCHAR(30) NOT NULL,
            city VARCHAR(30) NOT NULL,
            year VARCHAR(30) NOT NULL
            )";

        if($conn->query($sql) === TRUE){
            // send back success message
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    // Get all employee records from the database
    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT name, universityNumber, city, year, university from $table ORDER BY universityNumber DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    // Add a Student
    if("ADD_STU" == $action){
        // App will be posting these values to this server
        $name = $_POST["name"];
        $city = $_POST["city"];
        $year = $_POST["year"];
        $university = $_POST["university"];
        $universityNumber = $_POST["universityNumber"];
        $sql = "INSERT INTO $table (name, city, year, university, universityNumber) VALUES ('$name', '$city', '$year', '$university', '$universityNumber')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }

    // Remember - this is the server file.
    // I am updating the server file.
    // Update an Employee
    if("UPDATE_STU" == $action){
        // App will be posting these values to this server
        $emp_id = $_POST['emp_id'];
        $first_name = $_POST["first_name"];
        $last_name = $_POST["last_name"];
        $sql = "UPDATE $table SET first_name = '$first_name', last_name = '$last_name' WHERE id = $emp_id";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

    // Delete a Student
    if('DELETE_STU' == $action){
        $university_number = $_POST['university_number'];
        $sql = "DELETE FROM $table WHERE university_number = $university_number"; // don't need quotes since id is an integer.
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

?>