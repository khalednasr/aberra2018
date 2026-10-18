: $Id: xtra.mod,v 1.4 2014/08/18 23:15:25 ted Exp ted $
: 2018/05/20 Modified by Aman Aberra 

NEURON {
	SUFFIX xtra
	RANGE es : (es = max amplitude of the potential due to 1st E-field)		
	RANGE es2 : (es2 = max amplitude of the potential due to 2nd E-field)		
	RANGE x, y, z, type, order
	GLOBAL stim : (stim = normalized waveform of 1st E-field)
	GLOBAL stim2 : (stim1 = normalized waveform of 2nd E-field)
	POINTER ex 
}

PARAMETER {	
	es = 0 (mV)
	es2 = 0 (mV)
	x = 0 (1) : spatial coords
	y = 0 (1)
	z = 0 (1)		
	type = 0 (1) : numbering system for morphological category of section - unassigned is 0
	order = 0 (1) : order of branch/collateral. 
}

ASSIGNED {
	v (millivolts)
	ex (millivolts)
	stim (unitless) 		
	stim2 (unitless) 		
	area (micron2)
}

INITIAL {
	ex = stim*es + stim2 * es2	
}


BEFORE BREAKPOINT { : before each cy' = f(y,t) setup
  ex = stim*es + stim2 * es2	
}

