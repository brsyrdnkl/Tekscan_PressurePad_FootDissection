% clear all
% close all

px2cm=sqrt(0.702579);
time=0:0.02:90-0.02;
kPa2N=0.0702579;

data = cell2mat(struct2cell(load('oztua01.mat')));

x=cut(data);
%-------------------------------------------------------------------------

%------------------------------------------------------------------------- 





[FL, ML, HL, FR, MR, HR,]=dissection(x,2,points);

 L=FL+ML+HL;
 R=FR+MR+HR;



% -------------------------------------------------------------------------
% size_frame=size(x);
% pltt=FL+FR+HL+HR;
% figure
%  for i=1:100:size_frame(2)
%      
%     frame_plot = reshape(pltt(:,i,:),[size_frame(1),size_frame(3)]);
%     image(frame_plot,'CDataMapping','scaled')
%     pause(0.03)
%     
%  end
% -------------------------------------------------------------------------


[AP_FL, pressure_FL]= d_AP(FL);
[ML_FL, pressure_FL]= d_ML(FL);
[AP_FR, pressure_FR]= d_AP(FR);
[ML_FR, pressure_FR]= d_ML(FR);

[AP_MR, pressure_MR]= d_AP(MR);
[ML_MR, pressure_MR]= d_ML(MR);
[AP_ML, pressure_ML]= d_AP(ML);
[ML_ML, pressure_ML]= d_ML(ML);

[AP_HR, pressure_HR]= d_AP(HR);
[ML_HR, pressure_HR]= d_ML(HR);
[AP_HL, pressure_HL]= d_AP(HL);
[ML_HL, pressure_HL]= d_ML(HL);


ALL=FL+ML+HL+FR+MR+HR;
[CoPx, total_weight1]= d_AP(ALL);
[CoPy, total_weight2]= d_ML(ALL);

%-------------------------------------------------------------------------

