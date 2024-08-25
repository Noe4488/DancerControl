
ACTION Act_Parameters:
	
	//---- Numero del Eje ----///
	AxisIndex := VMASTER;
	
	//---- MpLink ----//
	MpLink 		:= gVMasterLink;
	Axis 			:= ADR(gVMaster);
	
	//---- Nombre del eje ----//
	AxisName := ' Virtual Master ';
	
	//---- Hablita el eje ----//
	gAxis[AxisIndex].Enable := TRUE; 
	
	//---- Limite de velocidad -----//
	LimitSpeed 	:= 6600.0;
	
	//----- Limete de aceleracion/desaceleracion ----//
	LimitAccDec := 6600.0;
	
	//---- Relacion de velocoidad motor/reductor ----// 
	GearIn 	:= 1;
	GearOut := 1;
	
	//---- Seleccion direccion de rotacion del eje ----//
	AxisDirection := TRUE; // TRUE = sentido de las manesillas del reloj; FALSE = en contra de las manesillas del reloj;
	
	// ---- Definicion Paramentros de posicion del eje ----//
	Period 				:= 360.0; 
	Resolution		:= 0.01;
	
	/////////////////////////////////////////////////////////////////

END_ACTION