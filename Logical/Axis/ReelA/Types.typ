
TYPE
	AxisState_enum : 
		( (*Axis control steps*)
		STATE_WAIT := 0,
		STATE_POWER_ON := 10,
		STATE_ERROR := 20,
		STATE_STOP := 30,
		STATE_READY := 40,
		STATE_HOME := 50,
		STATE_AUTO := 60,
		STATE_MANUAL := 70,
		STATE_MAINT := 80
	);
	ConfigStates_enum : 
		( (*Axis Configuration steps *)
		CONFIG_WAIT := 0,
		CONFIG_LOAD_REQ := 10,
		CONFIG_LOAD_DONE := 20,
		CONFIG_SAVE_REQ := 30,
		CONFIG_SAVE_DONE := 70
	);

END_TYPE
