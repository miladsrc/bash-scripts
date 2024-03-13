module com.example.hw14 {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.hw14 to javafx.fxml;
    exports com.example.hw14;
}