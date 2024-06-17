function [BW]= select_noise(input)



size_frame=size(input);

figure
  for t=1:10:size_frame(2)
 t
     frame_plot = reshape(input(:,t,:),[size_frame(1),size_frame(3)]);
     image(frame_plot,'CDataMapping','scaled')
     pause(0.01)
 
  end


fprintf("Please Increase the Brightness of Your Screen and Select the noise (yellow region)") 
  
timesum_F=reshape(sum(input,2),[size_frame(1),size_frame(3)]);
imageSegmenter(timesum_F);




end