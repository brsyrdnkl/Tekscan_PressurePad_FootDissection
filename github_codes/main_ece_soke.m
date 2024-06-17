clc; clear all;
px2cm=sqrt(0.702579);
time=0:0.02:90-0.02;
kPa2N=0.0702579;

%Firstly load the data
x=load('oztua01.mat');
x=x.data; 
% -------------------------------------------------------------------------
%This section is used for visualization of the pressure matrices in time
size_frame=size(x);
figure
 for i=1:1:size_frame(2)        %for loop runs the film
    frame_plot(:,:) = x(:,i,:); %Assign the particular frame numbered i in
                                %time to corresponding frame_plot
    image(frame_plot,'CDataMapping','scaled')
    pause(0.03)                  %add a pause command as fps of the movie
 end
% -------------------------------------------------------------------------

x=cut(data);            %this function cuts empty rows and columns from the
                        % whole data all over the time t<T
