

PROGRAM _INIT
	(*Simulation*)
	SimulationModel.Enable := TRUE;
    
	ConfigurationParameters.Geometry.WinderWidth := 1000.0;
	ConfigurationParameters.Geometry.MaterialThickness := 80.0;
	ConfigurationParameters.Geometry.MaxDiameter := 900.0;
	ConfigurationParameters.Geometry.MinDiameter := 90.0;
	ConfigurationParameters.Geometry.MinInertia := 0.39;
	ConfigurationParameters.Geometry.TestDiameter := 820.6;
	ConfigurationParameters.Geometry.TestInertia := 4.3;    
        
	ConfigurationParameters.Axis.LineUnits := 100000; (* 1 (line) unit = =  1 µm *)    
	ConfigurationParameters.Axis.WinderUnits := 360000;    (* 1 winder (unit) = =  0.001° *)
	ConfigurationParameters.Axis.RevMotor := 25;     
	ConfigurationParameters.Axis.GearRatio := 2.5; (* gear ratio [1] *)        
	ConfigurationParameters.Axis.WinderType := mtWND_UNWIND; (* unwinder *)    
    
	SimulationParameters.MaterialLength := 4000.0;
	SimulationParameters.StartDiameter := 820.2;    
	SimulationParameters.DancerInertia := 3.25;    
	SimulationParameters.DancerLength := 500.0;    
	SimulationParameters.MaxDancerPosition := 240.0;    
	SimulationParameters.SpeedTorqueFactor := 0.01;
	SimulationParameters.TorqueConstant := 2.1;    
	SimulationParameters.Noise := 1; (* additive noise *)        
	SimulationModel.ModelType := mtWND_DANCER;
	SimulationModel.TorqueMode := mtWND_TORQUE_FF;    
	SimulationModel.SetDancerTorque := 200.0;    

	InitSpeedController := TRUE;    
	ActProportionalGain := 88.6;    
	ActIntegrationTime := 0.143;  
	
	(*Diameter Estimation*)
	DiameterEstimator.Enable := TRUE;

	DiameterEstimator.Configuration.Geometry.WinderWidth := 1000; (*mm*)
	DiameterEstimator.Configuration.Geometry.MaterialThickness := 80.0; (*µm*)
	DiameterEstimator.Configuration.Geometry.MaxDiameter := 900.0; (*mm*)
	DiameterEstimator.Configuration.Geometry.MinDiameter := 90.0; (*mm*)
	DiameterEstimator.Configuration.Geometry.MinInertia := 0.39; (*kgm²*)
	DiameterEstimator.Configuration.Geometry.TestDiameter := 820.6;
	DiameterEstimator.Configuration.Geometry.TestInertia := 4.30;
        
	DiameterEstimator.Configuration.Axis.LineUnits := 1000000; (* 1 (line) unit := :=  1 µm *)
	DiameterEstimator.Configuration.Axis.WinderUnits := 360000; (* 1 winder (unit) := :=  0.001° *)
	DiameterEstimator.Configuration.Axis.RevMotor := 1;
	DiameterEstimator.Configuration.Axis.GearRatio := 1.0; (* gear ratio := 1 *)
	DiameterEstimator.Configuration.Axis.WinderType := mtWND_UNWIND; (* unwinding system *)
    
	DiameterEstimator.Parameters.CyclicEstimationWindow := 360000;
    
	DiameterEstimator.Mode := mtWND_POSITION_BASED;
	
	(*Dancer*)
	DancerController.Enable := TRUE;

	DancerController.Configuration.Geometry.WinderWidth := 1000;
	DancerController.Configuration.Geometry.MaterialThickness := 80.0;
	DancerController.Configuration.Geometry.MaxDiameter := 900.0;
	DancerController.Configuration.Geometry.MinDiameter := 90.0;
	DancerController.Configuration.Geometry.MinInertia := 0.39;
	DancerController.Configuration.Geometry.TestDiameter := 820.6;
	DancerController.Configuration.Geometry.TestInertia := 4.30;
        
	DancerController.Configuration.Axis.LineUnits := 1000000; (* 1 (line) unit == 1 µm *)
	DancerController.Configuration.Axis.WinderUnits := 360000; (* 1 winder (unit) == 0.001° *)
	DancerController.Configuration.Axis.RevMotor := 1;
	DancerController.Configuration.Axis.GearRatio := 1.0; (* gear ratio = 1 *)
	DancerController.Configuration.Axis.WinderType := mtWND_UNWIND; (* unwinding system *)
    
	DancerController.Parameters.PIDParameters.Gain := 2.0;
	DancerController.Parameters.PIDParameters.IntegrationTime := 1.0;
	DancerController.Parameters.PIDParameters.DerivativeTime := 0.0;
	DancerController.Parameters.PIDParameters.FilterTime := 0.0;
	DancerController.Parameters.MaxLineVelocityCorrection := 1000.0; (* == 1 m/s *)
	DancerController.Parameters.MaxControlError := 0.0; (* material break detection off *)
    
	SetDancerPosition := 150.0;
	ActDiameter := 895.7;
	
	(*Axis Controller*)
	AxisController.Enable  :=  TRUE;

	AxisController.Configuration.Geometry.WinderWidth  :=  1000;
	AxisController.Configuration.Geometry.MaterialThickness  :=  80.0;
	AxisController.Configuration.Geometry.MaxDiameter  :=  900.0;
	AxisController.Configuration.Geometry.MinDiameter  :=  90.0;
	AxisController.Configuration.Geometry.MinInertia  :=  0.39;
	AxisController.Configuration.Geometry.TestDiameter  :=  820.6;
	AxisController.Configuration.Geometry.TestInertia  :=  4.30;
        
	AxisController.Configuration.Axis.LineUnits  :=  1000000; (* 1 (line) unit  :=  :=  1 µm *)
	AxisController.Configuration.Axis.WinderUnits  :=  360000; (* 1 winder (unit)  :=  :=  0.001° *)
	AxisController.Configuration.Axis.RevMotor  :=  1;
	AxisController.Configuration.Axis.GearRatio  :=  1.0; (* gear ratio  :=  1 *)
	AxisController.Configuration.Axis.WinderType  :=  mtWND_UNWIND; (* unwinding system *)
    
	AxisController.Parameters.MinTorque  :=  -50.0;
	AxisController.Parameters.MaxTorque  :=  50.0;
    
	AxisController.Parameters.Interpolation.MinProportionalGain  :=  20.6;
	AxisController.Parameters.Interpolation.TestProportionalGain  :=  88.6;
	AxisController.Parameters.Interpolation.MinIntegrationTime  :=  0.043;
	AxisController.Parameters.Interpolation.TestIntegrationTime  :=  0.143;

	//ActDiameter  :=  895.7;
	ActInertia  :=  4.7;
	SetMaterialTension  :=  150.0;
	
END_PROGRAM