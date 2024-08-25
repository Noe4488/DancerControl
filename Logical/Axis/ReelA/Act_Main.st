
ACTION Act_Main: 
	
	(*Command*)
	gAxis[AxisIndex].Command.Power := AxisBasic.Active AND AxisConfig.Active;
	AxisBasic.Stop := gAxis[AxisIndex].Command.Stop;
	
	(*Status*)
	gAxis[AxisIndex].Status.ActVelocity := AxisBasic.Velocity;
	gAxis[AxisIndex].Status.ActPosition := LREAL_TO_REAL(AxisBasic.Position);
	gAxis[AxisIndex].Status.PoweredOn 	:= AxisBasic.PowerOn;
	gAxis[AxisIndex].Status.Homed				:= AxisBasic.IsHomed;
	gAxis[AxisIndex].Status.DriveStatus.PLCopenState := AxisBasic.Info.PLCopenState;
	gAxis[AxisIndex].Status.PoweredOn 	:= AxisBasic.PowerOn;
	
	(*Axis State*)
	gAxis[AxisIndex].AxisState.Disabled 	:= NOT AxisBasic.Active;
	gAxis[AxisIndex].AxisState.StandStill := NOT AxisBasic.MoveActive;
	gAxis[AxisIndex].AxisState.ErrorStop 	:= AxisBasic.Error OR AxisConfig.Error;
	gAxis[AxisIndex].AxisState.StandStill := NOT AxisBasic.MoveActive;
	gAxis[AxisIndex].AxisState.ErrorStop 	:= AxisBasic.Error OR AxisConfig.Error;
	
	(*Error Reset*)
	IF gAxis[AxisIndex].Command.ErrorAcknowledge THEN 
		AxisBasic.ErrorReset := TRUE;
		AxisConfig.ErrorReset := TRUE;
	ELSE
		AxisBasic.ErrorReset := FALSE;
		AxisConfig.ErrorReset := FALSE;
	END_IF
	
	(**** Configuracion FB Read Axis Error ****)
	ReadAxisError.Configuration.Format 					:= mcWRAP;   //ReadAxisErrorPar;
	ReadAxisError.Configuration.LineLength 			:= SIZEOF(gAxis[AxisIndex].Status.ErrorText[0]);
	ReadAxisError.Configuration.DataLength 			:= SIZEOF(gAxis[AxisIndex].Status.ErrorText);
	ReadAxisError.Configuration.DataAddress 		:= ADR(gAxis[AxisIndex].Status.ErrorText[0]);
	ReadAxisError.Configuration.DataObjectName 	:= 'acp10etxen';
	
	(**** Error ****)
	
	IF gAxis[AxisIndex].AxisState.ErrorStop THEN 
		StAxis := STATE_ERROR;
	END_IF
	
//	(**** Speed Control/Accel Control ****)
//	
//	AxisBasicPar.Velocity 		:= gAxis[AxisIndex].Parameter.Velocity;
//	AxisBasicPar.Acceleration	:= gAxis[AxisIndex].Parameter.Acceleration;
//	AxisBasicPar.Deceleration := gAxis[AxisIndex].Parameter.Deceleration;
//
//	IF OldVelocity <> AxisBasicPar.Velocity OR OldAccel <> AxisBasicPar.Acceleration OR OldDecel <> AxisBasicPar.Deceleration THEN
//		AxisBasic.Update := TRUE;
//		OldVelocity := AxisBasicPar.Velocity;
//		OldAccel := AxisBasicPar.Acceleration;
//		OldDecel := AxisBasicPar.Deceleration;
//	ELSE
//		AxisBasic.Update := FALSE;
//	END_IF
	
	(**** Checks is the motor is powered On ****)
	
	IF NOT gAxis[AxisIndex].Command.Power THEN 
		StAxis := STATE_WAIT;
	END_IF
	
	(**** Checks the motor error ****)
	
	IF gAxis[AxisIndex].AxisState.ErrorStop THEN 
		StAxis:= STATE_ERROR;
	END_IF
	
	(**** Axis Sequencer ****)
	
	CASE StAxis OF
		
		STATE_WAIT:
			
			IF AxisBasic.Active AND AxisBasic.Info.BootState = mpAXIS_BLP_DONE AND AxisConfig.Active AND AxisBasic.Info.ReadyToPowerOn AND ConfigDone THEN
				StAxis:= STATE_POWER_ON;
			ELSIF gAxis[AxisIndex].Command.Power AND NOT ConfigDone THEN 
				ConfigReq:= TRUE;
			END_IF
			
		STATE_POWER_ON:
		
			IF gAxis[AxisIndex].Command.Power AND NOT AxisBasic.PowerOn THEN 
				AxisBasic.Power := TRUE;
			ELSIF AxisBasic.PowerOn THEN 
				StAxis:= STATE_HOME;
			END_IF
		
		STATE_HOME:
		
			IF NOT AxisBasic.IsHomed THEN 
				AxisBasic.Home := TRUE;
			ELSIF AxisBasic.IsHomed THEN 
				AxisBasic.Home := FALSE;
				StAxis:= STATE_READY;
			END_IF
		
		STATE_READY:
		
		
			IF gAxis[AxisIndex].Command.VelocityControl THEN  
				StAxis:= STATE_AUTO;
			END_IF
			
		STATE_AUTO:
			
			(******************** VELOCITY CONTROL **********************)
			(* STATE: velocity control *)
			(* activate MC_BR_VelocityControl *)
			//			VelocityControl.Enable := TRUE;
			//			VelocityControl.CyclicVelocity := gControl.Winder.SetVelocity ;
			//			VelocityControl.CyclicVelocityCorrection :=  gControl.Winder.VelocityCorrection;
			//			VelocityControl.CyclicTorque := gControl.Winder.SetMotorTorque;
			//			VelocityControl.Acceleration := gAxis[AxisIndex].Parameter.Acceleration;     
			//			VelocityControl.Deceleration := gAxis[AxisIndex].Parameter.Deceleration ;   
			//			VelocityControl.TorqueMode := mcFF;
			//			VelocityControl.SctrlKv := gControl.Winder.ActProportionalGain;
			//			VelocityControl.SctrlTn := gControl.Winder.ActIntegrationTime;
			(* this feature is not possible for ACOPOS simulation *)
			// VelocityControl.InitSctrl := gControl.Winder.InitSpeedController;
			
			IF NOT gAxis[AxisIndex].Command.VelocityControl THEN 
				VelocityControl.Enable := FALSE;
				StAxis:= STATE_READY;
			END_IF

			
		STATE_ERROR:
		
			VelocityControl.Enable := FALSE;
		
	END_CASE
	
	
	
END_ACTION
