-- Open pit mining Capstone Project --

-- Creating a Database
CREATE DATABASE supply_chain;

-- Using the Database
USE supply_chain;

CREATE TABLE `cycle_data` (
  `ASSOCPAYLOADNOMINAL` text,
  `AT Available Time (iMine)` int DEFAULT NULL,
  `Autonomous` int DEFAULT NULL,
  `Available SMU Time` int DEFAULT NULL,
  `Available Time` int DEFAULT NULL,
  `Completed Cycle Count` int DEFAULT NULL,
  `COMPLETEDCYCLEDURATION` int DEFAULT NULL,
  `Creation Mode` int DEFAULT NULL,
  `CT Calendar SMU Time` int DEFAULT NULL,
  `CT Calendar Time` int DEFAULT NULL,
  `Cycle Duration` int DEFAULT NULL,
  `Cycle SMU Duration` int DEFAULT NULL,
  `Cycle Type` text,
  `Delay Time` int DEFAULT NULL,
  `Down Time` int DEFAULT NULL,
  `DTE Down Time Equipment` int DEFAULT NULL,
  `Dumping Duration` int DEFAULT NULL,
  `Dumping SMU Duration` int DEFAULT NULL,
  `Destination Dumping Start Timestamp (GMT8)` double DEFAULT NULL,
  `Empty EFH Distance` double DEFAULT NULL,
  `Empty EFH Length` double DEFAULT NULL,
  `Empty Expected Travel Duration` int DEFAULT NULL,
  `Empty Fall Height` double DEFAULT NULL,
  `Empty Plan Length` double DEFAULT NULL,
  `Empty Rise Height` text,
  `Empty Slope Distance` double DEFAULT NULL,
  `Empty Slope Length` double DEFAULT NULL,
  `Empty Target Travel Duration` int DEFAULT NULL,
  `Empty Travel Duration` int DEFAULT NULL,
  `End Processor Name` text,
  `Cycle End Timestamp (GMT8)` text,
  `Estimated Fuel Used` int DEFAULT NULL,
  `Fuel Used` double DEFAULT NULL,
  `Full Expected Travel Duration` int DEFAULT NULL,
  `Full Travel Duration` int DEFAULT NULL,
  `IC` int DEFAULT NULL,
  `Idle Duration` int DEFAULT NULL,
  `iMine Availability` int DEFAULT NULL,
  `iMine Engine Hours` int DEFAULT NULL,
  `iMine Load FCTR Truck` text,
  `iMine Operating Hours` int DEFAULT NULL,
  `iMine Utilisation` int DEFAULT NULL,
  `Loading Count` int DEFAULT NULL,
  `Loading Duration` int DEFAULT NULL,
  `Loading Efficiency` text,
  `Source Loading End Timestamp (GMT8)` double DEFAULT NULL,
  `Source Loading Start Timestamp (GMT8)` double DEFAULT NULL,
  `OPERATINGBURNRATE` double DEFAULT NULL,
  `OPERATINGTIME (CAT)` int DEFAULT NULL,
  `OPERHOURSSECONDS` int DEFAULT NULL,
  `Payload (kg)` int DEFAULT NULL,
  `Payload (t)` double DEFAULT NULL,
  `PREVIOUSSECONDARYMACHINE` text,
  `PREVIOUSSINKDESTINATION` text,
  `QUEUEATSINKDURATION` int DEFAULT NULL,
  `Queuing at Sink Duration` int DEFAULT NULL,
  `Queuing at Source Duration` int DEFAULT NULL,
  `Queuing Duration` int DEFAULT NULL,
  `Source Queuing Start Timestamp (GMT8)` double DEFAULT NULL,
  `SD_SCHEDULEDDOWNTIME` int DEFAULT NULL,
  `SDE_SCHEDULEDDOWNEQUIP` int DEFAULT NULL,
  `Cycle Start Timestamp (GMT8)` text,
  `TC` int DEFAULT NULL,
  `TMPH` double DEFAULT NULL,
  `TOTALTIME (CAT)` int DEFAULT NULL,
  `Travelling Empty Duration` int DEFAULT NULL,
  `Travelling Full Duration` int DEFAULT NULL,
  `TRUCKQUEUEATSOURCEDURATION` text,
  `UNSCHEDULEDDOWNCOUNT` int DEFAULT NULL,
  `UNSCHEDULEDDOWNTIME` int DEFAULT NULL,
  `Record Updated Timestamp (GMT8)` text,
  `WAITFORDUMPDURATION` int DEFAULT NULL,
  `WAITFORLOADDURATION` int DEFAULT NULL,
  `WORKINGBURNRATE` double DEFAULT NULL,
  `WORKINGDURATION` int DEFAULT NULL,
  `Source Location Name` text,
  `Source Location Description` text,
  `Source Location is Active Flag` text,
  `Source Location is Source Flag` text,
  `Destination Location Name` text,
  `Destination Location Description` text,
  `Destination Location is Active Flag` text,
  `Destination Location is Source Flag` text,
  `Primary Machine Name` text,
  `Primary Machine Category Name` text,
  `Primary Machine Class Name` text,
  `Secondary Machine Name` text,
  `Secondary Machine Category Name` text,
  `Secondary Machine Class Name` text,
  `Crew OID` bigint DEFAULT NULL,
  `Job Code Description` text,
  `Job Code Name` text,
  `Job Type` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `delay_data` (
  `Delay OID` bigint DEFAULT NULL,
  `Description` text,
  `ECF Class ID` text,
  `Acknowledge Flag` text,
  `Acknowledged Flag` text,
  `Confirmed Flag` text,
  `Engine Stopped Flag` text,
  `Field Notification Required Flag` text,
  `Office Confirm Flag` text,
  `Production Reporting Only Flag` text,
  `Frequency Type` int DEFAULT NULL,
  `Shift Type` text,
  `Target Location` text,
  `Target Road` text,
  `Workorder Ref` text,
  `Delay Class Name` text,
  `Delay Class Description` text,
  `Delay Class is Active Flag` text,
  `Delay Class Category Name` text,
  `Target Machine Name` text,
  `Target Machine is Active Flag` text,
  `Target Machine Class Name` text,
  `Target Machine Class Description` text,
  `Target Machine Class is Active Flag` text,
  `Target Machine Class Category Name` text,
  `Delay Reported By Person Name` text,
  `Delay Reported By User Name` text,
  `Delay Status Description` text,
  `Delay Start Timestamp (GMT8)` text,
  `Delay Finish Timestamp (GMT8)` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `location_data` (
  `Location_Id` int DEFAULT NULL,
  `Name` text,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

UPDATE `cycle_data`
SET `Loading Efficiency` = 75.65
WHERE `Loading Efficiency` IS NULL; 

UPDATE `cycle_data`
SET `Dumping Duration` = 42.86
WHERE `Dumping Duration` IS NULL; 

update `cycle_data`
set `Dumping SMU Duration` = 36.33
where `Dumping SMU Duration` IS null;

update `cycle_data`
set	`Empty Travel Duration` = 610
where `Empty Travel Duration` = 878;

update `cycle_data`
set `tmph` = 73784.62
where `tmph` IS null;

-- Creating Equipment Master Table
Create table Equipment_Master AS
select
`Primary Machine Name`, `Primary Machine Class Name`, 
`Secondary Machine Name`,`Secondary Machine Class Name`,
 `Loading Count`,`iMine Load FCTR Truck`, `PREVIOUSSECONDARYMACHINE`,
 `PREVIOUSSINKDESTINATION`, `End Processor Name`, `iMine Engine Hours`,
 `iMine Operating Hours`, `OPERATINGTIME (CAT)`, `OPERHOURSSECONDS`,
 `Full Travel Duration`, `Empty Travel Duration`,`Idle Duration`, 
 `Loading Duration`, `WAITFORDUMPDURATION`, `Dumping Duration`,
 `Payload (kg)`, `Estimated Fuel Used`,	`Fuel Used`, `Loading Efficiency`,
 `OPERATINGBURNRATE`, `TMPH`,`Job Code Name`
FROM cycle_data;

-- Creating Equipment_Type_Master Table

Create table Equipment_Type_Master As
select
`Cycle Type`, `Primary Machine Category Name`,
`Secondary Machine Category Name`,
`TC`, `AT Available Time (iMine)`, `Available SMU Time`, `Cycle Duration`,
`Cycle SMU Duration`,
`Down Time`, `Completed Cycle Count`, `iMine Availability`, `iMine Utilisation`, `Job Type`
from cycle_data;

-- Creating Location_Master Table
Create table Location_Master As
select
`Source Location Name`, `Destination Location Name` , `Queuing at Sink Duration`
`Queuing at Source Duration`, `Queuing Duration`,`Cycle End Timestamp (GMT8)`,
`Cycle Start Timestamp (GMT8)` ,
`Source Loading Start Timestamp (GMT8)`,
`Source Loading End Timestamp (GMT8)`
from cycle_data;

-- Creating movement_data Table
 Create table Movement_data As
select `Primary Machine Name` , `Secondary Machine Name`, 
`Source Location Name` , `Destination Location Name`, `Payload (kg)`, `Cycle Start Timestamp (GMT8)`,
`Cycle End Timestamp (GMT8)`, row_number () over () as `movement id` 
from cycle_data;

-- Creating Location_Type_Master Table
Create table Location_Type_Master As
select
`Source Location Description`, `Destination Location Description`,
`Empty EFH Distance` , `Empty Slope Distance` , `Queuing at Sink Duration`,
`Queuing at Source Duration` , `Queuing Duration`, `Source Location is Active Flag`,
`Source Location is Source Flag`,
`Destination Location is Active Flag`,
`Destination Location is Source Flag`
from cycle_data;

-- Creating Stored procedure for Cycle Data -- 

Delimiter $$
CREATE PROCEDURE `cycle_data1` ()
BEGIN
select
`Primary Machine Name`,
`Primary Machine Class Name`,
`Secondary Machine Name` ,
`Secondary Machine Class Name`,
`Loading Count`, `Cycle Type` ,
`TC`,
`Cycle Duration` , `Cycle SMU Duration` , `iMine Engine Hours`,
`iMine Operating Hours` ,
`OPERATINGTIME (CAT)`, `OPERHOURSSECONDS`,
`Cycle Start Timestamp (GMT8)` , `Cycle End Timestamp (GMT8)`,
`Payload (kg)` , `Empty EFH Distance` , `Completed Cycle Count`,
`iMine Availability` , `iMine Utilisation`
From cycle_data;
END $$
DELIMITER ;


-- Creating stored Procedure for Movement Data

DELIMITER $$
CREATE PROCEDURE `Movement_Data`()
BEGIN
select
`Source Location Name`,`Destination Location Name`,`Source Loading Start Timestamp (GMT8)`,
`Source Loading End Timestamp (GMT8)`,`Source Location Description`,
`Destination Location Description`,`Empty EFH Distance`,`Empty Slope Distance`,
`Source Location is Active Flag`,`Source Location is Source Flag`, 
`Destination Location is Active Flag`,`Destination Location is Source Flag`,
`Full Travel Duration`, `Empty Travel Duration`,`Idle Duration`, 
`Loading Duration`, `WAITFORDUMPDURATION`, `Dumping Duration`
from cycle_data;
END$$
DELIMITER ;

-- Creating stored Procedure for Delay Data

DELIMITER $$
CREATE PROCEDURE `Delay_data1`()
BEGIN
Select 
`Down Time`,
`Queuing at Source Duration`,`Queuing Duration`,`Queuing at Sink Duration`,
`Queuing at Source Duration`,`Queuing Duration`,
`Empty Travel Duration`,`Idle Duration`, `Loading Duration`, `WAITFORDUMPDURATION`,
`Dumping Duration`
from cycle_data;
END$$
DELIMITER ;

-- OEE CALCULATION -- 

Create table OEE As 
select 
`AT Available Time (iMine)`,`Down Time`,`iMine Operating Hours`,`OPERATINGTIME (CAT)`,
`Idle Duration`, 
(((`AT Available Time (iMine)`-`Down Time`)/nullif(`AT Available Time (iMine)`,0))*100) as Availability,
(((`OPERATINGTIME (CAT)`-`Idle Duration`)/nullif(`OPERATINGTIME (CAT)`,0))*100) as Performance, 
(((`iMine Operating Hours`-`Down Time`)/(nullif(`Down Time`+ `Idle Duration`,0)))*100) as Quailty
 from cycle_data;
 
 select * from OEE
 
   -- Creating Stored Procedure For OEE -- 
   
DELIMITER $$
CREATE PROCEDURE `OEE_Calculations`()
BEGIN
select 
`AT Available Time (iMine)`,
  `Down Time`,
  `iMine Operating Hours`,
  `OPERATINGTIME (CAT)`,
  `Idle Duration`,
  `Availability`,
  `Performance`,
  `Quailty` ,
  (`Availability`*  `Performance`*  `Quailty` ) as OEE
from oee ;
END$$
DELIMITER ;
