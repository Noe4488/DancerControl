
ACTION Act_AxisController: 
	
	
	
	
	SetLineVelocity := gLineVelocity; // Noe 

	AxisController.SetLineVelocity  :=  SetLineVelocity;
	AxisController.ActDiameter  :=  ActDiameter;
	AxisController.SetMaterialTension  :=  SetMaterialTension;
    
	AxisController.SynchronizationTime  :=  SynchronistionTime;
	AxisController.StartSynchronization  :=  StartSynchronisation;
	AxisController.StopSynchronization  :=  StopSynchronisation;
    
	AxisController();
    
	SetWinderVelocity  :=  AxisController.SetWinderVelocity;
	SetMotorTorque  :=  AxisController.SetMotorTorque;
    
	ActProportionalGain  :=  AxisController.ActProportionalGain;
	ActIntegrationTime  :=  AxisController.ActIntegrationTime;
	InitSpeedController  :=  AxisController.InitSpeedController; 

	gSetWinderVelocity := SetWinderVelocity;
	gSetMotorTorque := SetMotorTorque;
	gActProportionalGain := ActProportionalGain;
	gActIntegrationTime := ActIntegrationTime;
	gInitSpeedController := InitSpeedController;
END_ACTION
