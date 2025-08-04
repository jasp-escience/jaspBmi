import QtQuick
import JASP.Module

Description
{
	name		: "jaspBmi"
	title		: qsTr("Jasp BMI client")
	description	: qsTr("Talk to BMI servers")
	version		: "0.1"
	author		: "Stefan Verhoeven"
	maintainer	: "Stefan Verhoeven <s.verhoeven@esciencecenter.nl>"
	website		: "https://github.com/jasp-escience/jaspBmi"
	license		: "GPL (>= 2)"
	icon        : "bmiIcon.png" // Located in /inst/icons/
	preloadData: true
	requiresData: true


	GroupTitle
	{
		title:	qsTr("Basic functions")
	}

	Analysis
	{
	  title: qsTr("Add one")        // Title for window
	  menu: qsTr("Add one")         // Title for ribbon
	  func: "addOne"                // Function to be called
	  qml: "Integer.qml"            // Design input window
	  requiresData: false           // Allow to run even without data
	}
	
	Analysis
	{
	  title: qsTr("BMI Info")        // Title for window
	  menu: qsTr("BMI Info")         // Title for ribbon
	  func: "bmiInfo"                // Function to be called
	  qml: "BmiInfo.qml"             // Design input window
	  requiresData: false            // Allow to run even without data
	}


}
