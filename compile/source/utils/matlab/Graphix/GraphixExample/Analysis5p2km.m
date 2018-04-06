close all;
clear all;

LoadData     = 0;
LoadGridData = 0;
DumpData     = 0;
SavePlots    = 1;
GraphixDebug    = 0;
outputdir = '';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Experiments                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

datadir = '/Users/enderton/Data/CoupledExperiments/';

dtO = 3600;

expAq3p0km = 'Aq3p0km';
expRw3p0km = 'Rw3p0km';
expAq5p2km = 'Aq5p2km';
expRw5p2km = 'Rw5p2km';
expDr5p2km = 'Dr5p2km';

dirOcnAq3p0km = [datadir,'Aq3p0km_LW/Cpl29/Ocn/'  ];
dirOcnRw3p0km = [datadir,'Rw3p0km_LW/Cpl29/Ocn/'  ];
dirOcnAq5p2km = [datadir,'Aq5p2km_LW/Cpl1979/Ocn/'];
dirOcnRw5p2km = [datadir,'Rw5p2km_LW/Cpl1169/Ocn/'];
dirOcnDr5p2km = [datadir,'Dr5p2km_LW/Cpl29/Ocn/'  ];

dirAtmAq3p0km = [datadir,'Aq3p0km_LW/Cpl29/Atm/'  ];
dirAtmRw3p0km = [datadir,'Rw3p0km_LW/Cpl29/Atm/'  ];
dirAtmAq5p2km = [datadir,'Aq5p2km_LW/Cpl1979/Atm/'];
dirAtmRw5p2km = [datadir,'Rw5p2km_LW/Cpl1169/Atm/'];
dirAtmDr5p2km = [datadir,'Dr5p2km_LW/Cpl29/Atm/'  ];

grdOcnAq3p0km = [datadir,'/Aq3p0km_LW/GridOcn'];
grdOcnRw3p0km = [datadir,'/Rw3p0km_LW/GridOcn'];
grdOcnAq5p2km = [datadir,'/Aq5p2km_LW/GridOcn'];
grdOcnRw5p2km = [datadir,'/Rw5p2km_LW/GridOcn'];
grdOcnDr5p2km = [datadir,'/Dr5p2km_LW/GridOcn'];

grdAtmAq3p0km = [datadir,'/Aq3p0km_LW/GridAtm'];
grdAtmRw3p0km = [datadir,'/Rw3p0km_LW/GridAtm'];
grdAtmAq5p2km = [datadir,'/Aq5p2km_LW/GridAtm'];
grdAtmRw5p2km = [datadir,'/Rw5p2km_LW/GridAtm'];
grdAtmDr5p2km = [datadir,'/Dr5p2km_LW/GridAtm'];

dtA_Aq5p2km = 450;  itA_Aq5p2km = [136788480]; % Year 1979
dtO_Aq5p2km = 3600; itO_Aq5p2km = [ 17098560]; % Year 1979

dtA_Rw5p2km = 450;  itA_Rw5p2km = [ 80801280]; % Year 1169
dtO_Rw5p2km = 3600; itO_Rw5p2km = [ 10100160]; % Year 1169

dtA_Dr5p2km = 450;  itA_Dr5p2km = [ 9745920:69120:10022400]; % Year 146-150
dtO_Dr5p2km = 3600; itO_Dr5p2km = [ 1218240: 8640: 1252800]; % Year 146-150


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      Initialize field cell arrays                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CplT = {...
    {{'Ttave','tave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','T'},...
     {'Ttave','tave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','T'},...
     {'Ttave','tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','T'},...
     'Sbs'},...
    {{'Ttave','tave',dirOcnAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','T'},...
     {'Ttave','tave',dirOcnRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','T'},...
     {'Ttave','tave',dirOcnDr5p2km,grdOcnDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','T'},...
     'Sbs'},...
};

CplU = {...
    {{'uVeltave','tave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','U','Vector',1,...
      'Mate','vVeltave'},...
     {'uVeltave','tave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','U','Vector',1,...
      'Mate','vVeltave'},...
     {'uVeltave','tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','U','Vector',1,...
      'Mate','vVeltave'},...
     'Sbs'},...
    {{'uVeltave','tave',dirOcnAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','U','Vector',1,...
      'Mate','vVeltave'},...
     {'uVeltave','tave',dirOcnRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','U','Vector',1,...
      'Mate','vVeltave'},...
     {'uVeltave','tave',dirOcnDr5p2km,grdOcnDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','U','Vector',1,...
      'Mate','vVeltave'},...
     'Sbs'},...
};

CplPsi = {...
    {{'Psi','tave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km'},...
     {'Psi','tave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km'},...
     {'Psi','tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km'},...
     'Sbs'},...
    {{'Res','tave',dirOcnAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km'},...
     {'Res','tave',dirOcnRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km'},...
     {'Res','tave',dirOcnDr5p2km,grdOcnDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km'},...
     'Sbs'},...
};

Ocn1 = {...
    {{'Stave','tave',dirOcnAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','S'},...
     {'Stave','tave',dirOcnRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','S'},...
     {'Stave','tave',dirOcnDr5p2km,grdOcnDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','S'},...
     'Sbs'},...
    {{'Convtave','tave',dirOcnAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','Conv'},...
     {'Convtave','tave',dirOcnRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','Conv'},...
     {'Convtave','tave',dirOcnDr5p2km,grdOcnDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'O','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','Conv'},...
     'Sbs'},...
};

Atm1 = {...
    {{'Stave','tave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','S'},...
     {'Stave','tave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','S'},...
     {'Stave','tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','S'},...
     'Sbs'},...
    {{'','aim_RHtave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','RH'},...
     {'','aim_RHtave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','RH'},...
     {'aimRHtave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Con',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','RH'},...
     'Sbs'},...
};

Cpl1 = {...
    {{'SSTtave','cpl_tave',dirOcnAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'C','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','SST'},...
     {'SSTtave','cpl_tave',dirOcnRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'C','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','SST'},...
     {'SSTtave','cpl_tave',dirOcnDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'C','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','SST'},...
     'OvE'},...
    {{'TXtave','cpl_tave',dirOcnAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itO_Aq5p2km,dtO_Aq5p2km,'C','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','Vector',1,'Mate','TYtave',...
      'PlotFld','TX'},...
     {'TXtave','cpl_tave',dirOcnRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itO_Rw5p2km,dtO_Rw5p2km,'C','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','Vector',1,'Mate','TYtave',...
      'PlotFld','TX'},...
     {'TXtave','cpl_tave',dirOcnDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itO_Dr5p2km,dtO_Dr5p2km,'C','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','Vector',1,'Mate','TYtave',...
      'PlotFld','TX'},...
    'OvE'},...
};

Aim1 = {...
    {{'','aimPhytave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','aimT0',...
      'Index',{'+',16}},...
     {'','aimPhytave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','aimT0',...
      'Index',{'+',16}},...
     {'aimT0tave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','aimT0'},...
     'OvE'},...
    {{'','aimPhytave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','EmP',...
      'Index',{'+',8,'-',9,'-',10}},...
     {'','aimPhytave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','EmP',...
      'Index',{'+',8,'-',9,'-',10}},...
     {'aimT0tave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','EmP',...
      'Index',{'+','EVAPtave','-','PRECNVtave','-','PRECLStave'}},...
     'OvE'},...
    {{'','aimPhytave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','CLOUDC',...
      'Index',{'+',11}},...
     {'','aimPhytave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','CLOUDC',...
      'Index',{'+',11}},...
     {'CLOUDCtave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','CLOUDC'},...
     'OvE'},...
};

Aim2 = {...
    {{'','aimPhytave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','TSR',...
      'Index',{'+',3}},...
     {'','aimPhytave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','TSR',...
      'Index',{'+',3}},...
     {'TSRtave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','TSR'},...
     'OvE'},...
    {{'','aimPhytave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','OLR',...
      'Index',{'+',4}},...
     {'','aimPhytave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','OLR',...
      'Index',{'+',4}},...
     {'OLRtave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','OLR'},...
     'OvE'},...
    {{'','aimPhytave',dirAtmAq5p2km,grdAtmAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','SHF',...
      'Index',{'+',7}},...
     {'','aimPhytave',dirAtmRw5p2km,grdAtmRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'A','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','SHF',...
      'Index',{'+',7}},...
     {'SHFtave','aim_tave',dirAtmDr5p2km,grdAtmDr5p2km,expDr5p2km,'Tav',...
      itA_Dr5p2km,dtA_Dr5p2km,'A','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','SHF'},...
     'OvE'},...
};

Ice1 = {...
    {{'','ice_fract',dirAtmAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'I','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','fract'},...
     {'','ice_fract',dirAtmRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'I','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','fract'},...
      {'fract_ave','thsice_tave',dirAtmDr5p2km,grdOcnDr5p2km,expDr5p2km,...
       'Tav',itA_Dr5p2km,dtA_Dr5p2km,'I','MNC','MNC','Avg','Zon','Lin',...
       'GridSuffix','_C32_Dr5p2km','PlotFld','fract'},...
      'OvE'},...
    {{'','ice_iceH',dirAtmAq5p2km,grdOcnAq5p2km,expAq5p2km,'Tav',...
      itA_Aq5p2km,dtA_Aq5p2km,'I','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Aq5p2km','PlotFld','iceH'},...
     {'','ice_iceH',dirAtmRw5p2km,grdOcnRw5p2km,expRw5p2km,'Tav',...
      itA_Rw5p2km,dtA_Rw5p2km,'I','MDS','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Rw5p2km','PlotFld','iceH'},...
     {'iceH_ave','thsice_tave',dirAtmDr5p2km,grdOcnDr5p2km,expDr5p2km,...
      'Tav',itA_Dr5p2km,dtA_Dr5p2km,'I','MNC','MNC','Avg','Zon','Lin',...
      'GridSuffix','_C32_Dr5p2km','PlotFld','iceH'},...
     'OvE'},...
};

GraphixRun(CplT  ,'Cpl_T'  ,'LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug,'Orientation','landscape');
% GraphixRun(CplU  ,'Cpl_U'  ,'LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug,'Orientation','landscape');
% GraphixRun(CplPsi,'Cpl_Psi','LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug,'Orientation','landscape');
% GraphixRun(Ocn1,'Ocn_S+Conv' ,'LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug,'Orientation','landscape');
% GraphixRun(Atm1,'Atm_S+RH'   ,'LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug,'Orientation','landscape');

% GraphixRun(Cpl1,'Cpl_Fields1','LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug);
% GraphixRun(Aim1,'Aim_Fields1','LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug);
% GraphixRun(Aim2,'Aim_Fields2','LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug);
% GraphixRun(Ice1,'Ice_Fields1','LoadData',LoadData,'LoadGridData',LoadGridData,'SavePlots',SavePlots,'GraphixDebug',GraphixDebug);