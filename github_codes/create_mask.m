function [BW] =create_mask(FL,FR)

F=FL+FR;

size_frame=size(F);

figure
  for t=1:100:size_frame(2)
 t
     frame_plot = reshape(FL(:,t,:)+FR(:,t,:),[size_frame(1),size_frame(3)]);
     image(frame_plot,'CDataMapping','scaled')
     pause(0.01)
 
  end


fprintf("Please Increase the Brightness of Your Screen") 
  
timesum_F=reshape(sum(F,2),[size_frame(1),size_frame(3)]);
imageSegmenter(timesum_F);



end