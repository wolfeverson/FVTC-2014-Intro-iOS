<?php
/*
 * Sample Input
 * {
 * "id":"3",
 * "timestamp":"2264352",
 * "command":"delete"
 * }
 * 
 * Sample Successful Return
 * {
 * "status":"ok",
 * "message":"Account has been deleted :(",
 * "timestamp":"2264352"
 * }
 */


//get input
$json = file_get_contents('php://input');
//get timestamp
$FloorSeconds = mktime();
$FloorSeconds = $FloorSeconds / 100;
$FloorSeconds = round($FloorSeconds);
$FloorSeconds = floor( $FloorSeconds);
$isfail = false;
//decode json and verify decoding
$obj = json_decode($json, true);
if (count($obj) == 0)
{
  $response = '{ "status":"error", "message":"Please check your JSON formatting", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;
	$isfail = true;
}
else
{
	$id = $obj['id'];
	$command = $obj['command'];
	$ts = $obj['timestamp'];
//if($ts != $FloorSeconds)
if(1!=1)
{
  $response = '{ "status":"error", "message":"Please check your TimeStamp", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
	$isfail = true;
}
if ($command != "delete")  //this is an added security measure to ensure future code doesnt accidentally delete.
{
	$isfail = true;
}
}//else close

//no brackets pass through this line /////
if ($isfail == false)
{
try
{
		$dsn = 'mysql:host=xxx;dbname=xxx';
		$username = 'xxx';
		$password = 'xxx';	
		$options = array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION);		
		$db = new PDO ($dsn,$username,$password,$options);
		$delete = "DELETE from CustomerInfo WHERE CustomerID = :CustomerID";
		$SQL = $db->prepare($delete);
		$SQL->bindValue(':CustomerID', $id);		
		$SQL->execute();
		$SQL->closeCursor();
		$db = null;
  		$response = '{ "status":"ok", "message":"Account has been deleted :(","timestamp":"'. $FloorSeconds . '"}';
    	echo $response;	
}//end try
catch (PDOException $ex)
{
	$mess = $ex->getMessage();
  $response = '{ "status":"error", "message":"'.$mess.'", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
}  
}
else {
	{
	$response = '{ "status":"error", "message":"Something Broke...", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
	}
}
?>
