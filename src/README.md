To run the simulation start the file init.hoc

This will simulate the network model and reproduce the results
associated with Fig. 6 in:

Conde-Sousa E and Aguiar P, "A working memory model for serial order
that stores information in the intrinsic excitability properties of
neurons", JComputNeuroscience 2013

This is a network model with several neurons: the simulation therefore
takes a while(*)

A raster plot is automatically generated in NEURON after the
simulation. Alternativelly you can run the MATLAB script plotspikes.m
(or plotspikes_for_all_neurons.m) after the NEURON simulation is
completed to generate the raster in MATLAB.

In the raster plot:

- neurons with id from 0 to N_PRINCIPAL_NEURONS-1 are inhibitory
  interneurons
- neurons with id from N_PRINCIPAL_NEURONS to 2*N_PRINCIPAL_NEURONS-1
  are principal neurons
- all other are gate interneurons


(*)A smaller version of the network can be explored (lines 42-50 in
WMSeqLearn.hoc):

N_PRINCIPAL_NEURONS = 20                
GATES_SAMPLING_FRACTION = 1        
CONN_RATE = 0                                        
N_PATTERNS = 5                  
PATTERN_SIZE = 3
