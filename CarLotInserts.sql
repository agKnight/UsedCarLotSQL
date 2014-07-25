USE usedcarlot;
INSERT INTO previous_owner (First_Name,Last_Name,Address,City,Postal_Code)
VALUES ("Jim","Bob","123 White Street","Sault Ste Marie","P6B 6J2"),
	   ("Sandy","Beach","123 Blue Street","Sault Ste Marie","P6B 6J2"),
	   ("Chuck","Wagon","123 Green Street","Sault Ste Marie","P6B 6J2"),
	   ("Suzzie","Polumbo","123 Purple Street","Sault Ste Marie","P6B 6J2"),
	   ("Dick","Chase","123 Red Street","Sault Ste Marie","P6B 6J2"),
	   ("Some","Dude","123 Yellow Street","Sault Ste Marie","P6B 6J2"),
	   ("Mister","Foo","123 Pink Street","Sault Ste Marie","P6B 6J2"),
	   ("This","Guy","123 Orange Street","Sault Ste Marie","P6B 6J2"),
	   ("That","Guy","123 Grey Street","Sault Ste Marie","P6B 6J2");

INSERT INTO new_owner (First_Name,Last_Name,Address,City,Postal_Code)
VALUES ("Jim","Bob","123 White Street","Sault Ste Marie","P6B 6J2"),
	   ("Sandy","Beach","123 Blue Street","Sault Ste Marie","P6B 6J2"),
	   ("Chuck","Wagon","123 Green Street","Sault Ste Marie","P6B 6J2"),
	   ("Suzzie","Polumbo","123 Purple Street","Sault Ste Marie","P6B 6J2"),
	   ("Dick","Chase","123 Red Street","Sault Ste Marie","P6B 6J2"),
	   ("Some","Dude","123 Yellow Street","Sault Ste Marie","P6B 6J2"),
	   ("Mister","Foo","123 Pink Street","Sault Ste Marie","P6B 6J2"),
	   ("This","Guy","123 Orange Street","Sault Ste Marie","P6B 6J2"),
	   ("That","Guy","123 Grey Street","Sault Ste Marie","P6B 6J2");

INSERT INTO vehicle (Vin,Make,Model,`Year`,Color,On_Lot,Price,Previous_Owner_Previous_Owner_ID,New_Owner_New_Owner_ID)
VALUES (213822828288763,"Ford","Taurus",2001,"Black",1,2399.99,1,1),
	   (213343546548763,"Chevy","Venture",2003,"Black",1,1387.99,1,1),
	   (213678987564763,"Honda","Civic",2005,"Black",1,3432.99,1,1),
	   (213823438288763,"Toyota","Tundra",1999,"Black",1,3434.99,1,1),
	   (213823344488763,"Kia","Sorento",2007,"Black",1,6755.99,1,1),
	   (213822328288763,"Saturn","Mist",2011,"Black",1,7876.99,1,1),
	   (213822826576573,"Nissan","280Z",2003,"Black",1,4344.99,1,1),
	   (213432428288763,"Ford","Mustang",2003,"Black",1,3434.99,1,1),
	   (213822450288763,"Chevy","Blazer",2002,"Black",1,3423.99,1,1),
	   (213822826788063,"GMC","Sierra",2003,"Black",1,3433.99,1,1),
	   (213820000088763,"Mitsubishi","Lancer",2003,"Black",1,3433.99,1,1),
	   (213822564588763,"Subaru","Impreza",2004,"Black",1,4543.99,1,1);

INSERT INTO maintenance_schedule(Vehicle_Vin,Engine_Test,Engine_Pass,Brake_Test,Brake_Pass,Electrical_Test,Electrical_Pass,Fluid_Test,Fluid_Pass,Tire_Test,Tire_Pass,Window_Test,Window_Pass,Road_Test,Road_Pass)
VALUES (213822828288763,"2014-10-01",1,"2014-10-01",1,"2014-10-01",1,"2014-10-01",1,"2014-10-01",1,"2014-10-01",1,"2014-10-01",1);
	   
