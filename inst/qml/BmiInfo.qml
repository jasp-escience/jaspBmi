import QtQuick
import QtQuick.Layouts
import JASP.Controls
import JASP.Widgets
import JASP

Form
{

  info: qsTr("This analysis talks to a Bmi server endpoint. \
  And gathers info on the endpoint like component name, output variables and their units.")

  Text
  {
	  text: qsTr("Get information from a BMI server endpoint.")
  }
  TextField
  {
	  name: "endpoint_url"
	  label: qsTr("Endpoint URL")
	  defaultValue: "http://localhost:50051"
	  fieldWidth: 300
  }

}