
ACTION Act_Dancer: 
	
	

	
	DancerController.SetDancerPosition := SetDancerPosition;
	DancerController.ActDancerPosition := ActDancerPosition;
    
	DancerController.ActDiameter := ActDiameter;
   
	(*************** DancerController *************************)
	
	DancerController();
    
	VelocityCorrection := DancerController.VelocityCorrection;

	gVelocityCorrection := VelocityCorrection;
	

END_ACTION
