<?php
/*

 * Sample Input
 * {
 * "id":"3",
 * "password":"Secret",
 * "timestamp":"2264352"
 * }
 * 
 * Sample Successful Return
 * {
 * "status":"ok",
 * "message":"Login Valid",
 * "timestamp":"2264352"
 * }
 * 
 */



//get input
$json = file_get_contents('php://input');
//get timestamp
$FloorSeconds = mktime();
$FloorSeconds = $FloorSeconds / 100;
$FloorSeconds = round($FloorSeconds);
$FloorSeconds = floor( $FloorSeconds);
//decode json and verify decoding
$obj = json_decode($json, true);
if (count($obj) == 0)
{
  $response = '{ "status":"error", "message":"Please check your JSON formatting", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;
}
else
{
	$id = $obj['id'];
	$pw = $obj['password'];
	$ts = $obj['timestamp'];
//if($ts != $FloorSeconds)
if(1!=1)
{
  $response = '{ "status":"error", "message":"Please check your TimeStamp", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
}
else
{    

//sql(PDO) to pull up 
try
{
		$dsn = 'mysql:host=itsql.fvtc.edu;dbname=60314_200102410';
		$username = '60314_200102410';
		$password = '60314_200102410';	
		$options = array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION);		
		$db = new PDO ($dsn,$username,$password,$options);
		$select = "SELECT * FROM CustomerInfo WHERE CustomerID = :CustomerID";			
		$SQL = $db->prepare($select);
		$SQL->bindValue(':CustomerID', $id);		
		$SQL->execute();
		$Customer = $SQL->fetch();
		$Password  = $Customer['Password'];
		$Name = $Customer['FirstName'];
		$CustomerId = $Customer['CustomerID'];
		$Last = $Customer['LastName'];
		$Address = $Customer['Address'];
		$City = $Customer['City'];
		$State = $Customer['State'];
		$Zip = $Customer['Zip'];
		$Phone = $Customer['Phone'];
		$Email = $Customer['EMail'];
		$SQL->closeCursor();
		$db = null;
if($pw == $Password)
{
  $response = '{
  				"status":"ok", 
  				"timestamp":"'. $FloorSeconds . '",
  				"first" : "'.$Name.'", 
  				"last" : "'.$Last.'",   
  				"address" : "'.$Address.'",   
  				"city" : "'.$City.'",   
  				"state" : "'.$State.'",   
  				"zip" : "'.$Zip.'", 
   				"phone" : "'.$Phone.'",   
  				"email" : "'.$Email.'"			
     			}';
    echo $response;	
}
else
{
  $response = '{ "status":"error", "message":"Login Data Invalid", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
}
		
}//end try
catch (PDOException $ex)
{
	$mess = $ex->getMessage();
  $response = '{ "status":"error", "message":"'.$mess.'", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
}
}//if timestamp end
}//if json valid end       
?>
