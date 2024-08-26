
PROGRAM _INIT
	
	(**** Datos de simulacion ****)
	RollerDiamter:= 100.0; // Diametro del rodillo en milimetros
	gAxis[VMASTER].Parameter.Acceleration := 10000.0; // grados/s
	gAxis[VMASTER].Parameter.Deceleration := 10000.0; // grados/s
	LinearVelocity := 400.0; // Setpoint en mm/s
	
END_PROGRAM

PROGRAM _CYCLIC
  
	(**** Calculo de velocidad para cambiarla a mm/s ****)
	gAxis[VMASTER].Parameter.Velocity := ((LinearVelocity * 360)/(PI * RollerDiamter));
	AngularVelocity := (gAxis[VMASTER].Status.ActVelocity * (PI/180)) * (RollerDiamter / 2);
	(*LinearVelocity := gControl.Cmd.LineVelocity;*)
	gLineVelocity :=  AngularVelocity/0.001;
	
	
	CASE StLineCtrl OF 
		
		STATE_HOMING:
			
			(*************** STATE HOMING **************************)
			
			IF gAxis[VMASTER].Status.Homed THEN 
				StLineCtrl:= STATE_STANDSTILL;
			END_IF
			
		STATE_STANDSTILL:
			
			(*************** STATE STANDSTILL **********************)
			
			IF Start THEN
				StLineCtrl := STATE_MOTION;
			END_IF
			
		STATE_MOTION:
			
			(*************** STATE MOTION **************************)
			
			(*gAxis[VMASTER].Parameter.Acceleration := 10000.0; // grados/s*)
			(*gAxis[VMASTER].Parameter.Deceleration := 10000.0; // grados/s*)
			
			Start := FALSE;
			gAxis[VMASTER].Command.MoveVelocity := TRUE;
			gAxis[REEL_A].Command.VelocityControl := TRUE;
			
			IF Stop THEN
				gAxis[VMASTER].Command.MoveVelocity := FALSE;
				gAxis[REEL_A].Command.VelocityControl := FALSE;
				StLineCtrl := STATE_STOPPING;
			END_IF
			
		STATE_STOPPING:
		
			(*************** STATE STOPPING ************************)			
			
			Stop := FALSE;
			
			IF gAxis[VMASTER].Status.ActVelocity = 0.0 THEN
				StLineCtrl:= STATE_STANDSTILL;
			END_IF
			
	END_CASE
	
				
			
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

