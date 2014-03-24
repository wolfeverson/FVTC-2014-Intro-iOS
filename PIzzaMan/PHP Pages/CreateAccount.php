<?php
/*
 * Sample Input
 * {
 * "first":"Joe",
 * "last":"B",
 * "phone":"(555)555-5555",
 * "email":"email@email.com",
 * "address":"123 Fake Street",
 * "city":"fake city",
 * "state":"WI",
 * "zip":"54944",
 * "password":"Secret",
 * "timestamp":"2264352"
 * }
 * 
 * Sample Successful Return
 * {
 * "status":"ok",
 * "message":"Account Creation Successful",
 * "userid":"19",
 * "userpass":"Secret",
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
//decode json and verify decoding
$obj = json_decode($json, true);
if (count($obj) == 0)
{
  $response = '{ "status":"error", "message":"Please check your JSON formatting", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;
}
else
{
	$first = $obj['first'];
	$last = $obj['last'];
	$phone = $obj['phone'];
	$email = $obj['email'];	
	$address = $obj['address'];
	$city = $obj['city'];	
	$state = $obj['state'];
	$zip = $obj['zip'];	
	$pass = $obj['password'];
	$ts = $obj['timestamp'];
//if($ts != $FloorSeconds)
if(1!=1)
{
  $response = '{ "status":"error", "message":"Please check your TimeStamp", "timestamp":"'. $FloorSeconds . '"   }';
    echo $response;	
}
else
{    

//sql(PDO)
try
{
		$dsn = 'mysql:host=xxx;dbname=xxx';
		$username = 'xxx';
		$password = 'xxx';	
		$options = array(PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION);		
		$db = new PDO ($dsn,$username,$password,$options);
		$insert = "Insert Into CustomerInfo (FirstName, LastName, Address, City, State, Zip, Phone, Email, Password) 
					Values(:FirstName, :LastName, :Address, :City, :State, :Zip, :Phone, :Email, :Password)";
		$SQL = $db->prepare($insert);
		$SQL->bindValue(':FirstName', $first);
		$SQL->bindValue(':LastName', $last);		
		$SQL->bindValue(':Address', $address);
		$SQL->bindValue(':City', $city);		
		$SQL->bindValue(':State', $state);		
		$SQL->bindValue(':Zip', $zip);		
		$SQL->bindValue(':Phone', $phone);		
		$SQL->bindValue(':Email', $email);		
		$SQL->bindValue(':Password', $pass);			
		$SQL->execute();
		$SQL->closeCursor();
		$custid = $db->lastInsertId();
		$db = null;
  		$response = '{ "status":"ok", "message":"Creation Successful","userid":"'.$custid.'","userpass":"'.$password.'","timestamp":"'. $FloorSeconds . '"   }';
    	echo $response;	
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
