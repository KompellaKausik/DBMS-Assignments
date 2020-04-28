create database courseraAssignments;
use courseraAssignments;


CREATE TABLE Customer
 (CustNo VARCHAR(8) NOT NULL, 
  CustName VARCHAR(30) NOT NULL, 
  Address VARCHAR(50) NOT NULL, 
  Internal CHAR(1) NOT NULL, 
  Contact VARCHAR(35) NOT NULL, 
  Phone VARCHAR(11) NOT NULL, 
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL, 
  Zip VARCHAR(10) NOT NULL,
  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo) ) ;
  
create table Employee (
    EmpNo varchar(8) not null,
    EmpName varchar(20) not null,
    Department varchar(20) not null,
    Email varchar(25) not null,
    Phone varchar(8) not null,
    primary key (EmpNo));

create table Facility (
    FacNo varchar(8) not null,
    FacName varchar(20) not null,
    primary key (FacNo));

create table Location (
    LocNo varchar(8) not null,
    FacNo varchar(8),
    LocName varchar(20) not null,
    primary key (LocNo),
    foreign key (FacNo) references Facility(FacNo));

create table ResourceTbl (
    ResNo varchar(8) not null,
    ResName varchar(20) not null,
    Rate decimal(8, 2),
    primary key (ResNo));



create table EventRequest(
    EventNo varchar(8) NOT NULL,
     DateHeld Date NOT NULL,
     DateReq Date NOT NULL,
     FacNo varchar(8) NOT NULL,
     CustNo varchar(8) NOT NULL,
     DateAuth Date,
     Status varchar(20) CHECK(Status IN('Pending','Approved','Denied')),
     EstCost int NOT NULL,
     EstAudience int CHECK(EstAudience>0),
     BudNo varchar(10),
     CONSTRAINT PKEventNo PRIMARY KEY(EventNo),
     CONSTRAINT FKFacNo FOREIGN KEY(FacNo) REFERENCES Facility(FacNo),
     CONSTRAINT FKCustNo FOREIGN KEY(CustNo) REFERENCES Customer(CustNo));



create table EventPlan(
     PlanNo varchar(8) NOT NULL,
     EventNo varchar(8) NOT NULL,
     WorkDate Date NOT NULL,
     Notes varchar(30) ,
     Activity varchar(20) NOT NULL,
     EmpNo varchar(8),
     CONSTRAINT PKPlanNo PRIMARY KEY(PlanNo),
     CONSTRAINT FKEventNo FOREIGN KEY(EventNo) REFERENCES EventRequest(EventNo),
     CONSTRAINT FKEmpNo FOREIGN KEY(EmpNo) REFERENCES Employee(EmpNo));

create table EventPlanLine(
     PlanNo varchar(8) NOT NULL,
     LineNo int NOT NULL,
     TimeStart DATETIME NOT NULL,
     TimeEnd DATETIME NOT NULL,
     NumberFld int NOT NULL,
     LocNo varchar(8) NOT NULL,
     ResNo varchar(8) NOT NULL,
     CONSTRAINT FKPlanNo FOREIGN KEY(PlanNo) REFERENCES EventPlan(PlanNo),
     CONSTRAINT FKLocNo FOREIGN KEY(LocNo) REFERENCES Location(LocNo),
     CONSTRAINT FKResNo FOREIGN KEY(ResNo) REFERENCES ResourceTbl(ResNo),
     CHECK(TimeStart<TimeEnd));

drop table EventPlan;
