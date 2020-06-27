package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class DodajZgloszenieController {

    @FXML
    private TextField title;

    @FXML
    private TextArea description;

    @FXML
    private ChoiceBox<?> type;

    @FXML
    private ChoiceBox<?> priority;

    @FXML
    private Button add;

    @FXML
    private Button cancel;

    @FXML
    private TextArea summary;

}
