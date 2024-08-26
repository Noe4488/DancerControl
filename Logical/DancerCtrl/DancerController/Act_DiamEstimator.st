
ACTION Act_DiamEstimator:
		
	
	

	
	DiameterEstimator.ActLinePosition := ActLinePosition;
	DiameterEstimator.ActWinderPosition := ActWinderPosition;
	DiameterEstimator.ActDancerPosition := ActDancerPosition;

	ActDiameter := DiameterEstimator.ActDiameter; 
	
	(*************** DiameterEstimator ***********************)
	
	ActLinePosition		:= REAL_TO_DINT(gAxis[VMASTER].Status.ActPosition);
	ActWinderPosition := REAL_TO_DINT(gAxis[REEL_A].Status.ActPosition);
	
	DiameterEstimator();
	

END_ACTION
