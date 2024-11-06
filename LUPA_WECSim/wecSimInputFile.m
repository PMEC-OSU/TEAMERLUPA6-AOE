%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
simu.simMechanicsFile = 'LUPA2body.slx';      % Specify Simulink Model File
simu.mode = 'normal';                   % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer = 'on';                   % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                     % Simulation Start Time [s]
simu.rampTime = 10;                    % Wave Ramp Time [s]
simu.endTime = 60;                     % Simulation End Time [s]
simu.solver = 'ode4';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
simu.dt = 0.01; 							% Simulation time-step [s]
simu.domainSize = 2;
simu.cicEndTime=5;

%% Wave Information 
waves = waveClass('regularCIC');           % Initialize Wave Class and Specify Type                                 
waves.height = 0.15;                     % Wave Height [m]
waves.period = 2.75;                       % Wave Period [s]

%% Body Data

% Float
body(1) = bodyClass('hydroData/lupa2body.h5');      
body(1).geometryFile = 'geometry/Float.stl';    % Location of Geomtry File
body(1).viz.color = [255/255 102/255 0];
body(1).mass = 'equilibrium';                       % Body Mass. The 'equilibrium' Option Sets it to the Displaced Water Weight
body(1).inertia = [66.1686 65.3344 17.16];  % Moment of Inertia [kg*m^2] x and y from experimental swing tests, z from solidworks    

% Spar/Plate
body(2) = bodyClass('hydroData/lupa2body.h5'); 
body(2).geometryFile = 'geometry/Spar.stl'; 
body(2).viz.color = [0 0 255/255];
body(2).mass = 'equilibrium';                   
body(2).inertia = [253.6344 250.4558 12.746];  % x and y from experimental swing tests, z from solidworks

%% PTO and Constraint Parameters
% Floating (3DOF) Joint
constraint(1) = constraintClass('Constraint1'); % Initialize Constraint Class for Constraint1
constraint(1).location = [0 0 0];               % Constraint Location [m]

% Translational PTO
pto(1) = ptoClass('PTO1');                      % Initialize PTO Class for PTO1
pto(1).stiffness = 0;                           % PTO Stiffness [N/m]
pto(1).damping = 0;                       % PTO Damping [N/(m/s)]
pto(1).location = [0 0 0];                      % PTO Location [m]

Kp = 1034;
Ki = -3816;