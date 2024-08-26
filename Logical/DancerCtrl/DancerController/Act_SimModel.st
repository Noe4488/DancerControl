
ACTION Act_SimModel:
	
	      
	
	SimulationModel.Configuration := ConfigurationParameters;        
	SimulationModel.Parameters := SimulationParameters;        
	SimulationModel.SetLineVelocity := SetLineVelocity;            
        
	SimulationModel.SetWinderVelocity := SetWinderVelocity;         
	SimulationModel.WinderVelocityCorrection := WinderVelocityCorrection;        
	SimulationModel.SetMotorTorque := SetMotorTorque;             

	SimulationModel.ActProportionalGain := ActProportionalGain;         
	SimulationModel.ActIntegrationTime := ActIntegrationTime;        
	SimulationModel.InitSpeedController := InitSpeedController;
	
	(*************** SimulationModel **************************)
	
	SimulationModel();
	

END_ACTION
