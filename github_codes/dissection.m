%-------------------------------------------------------------------------
                   %Find Critical Point START
%-------------------------------------------------------------------------

function [FL, ML, HL, FR, MR, HR]=dissection(data_cut,ntimes, points)



%-------------------------------------------------------------------------
                    %Divide Left and Right Foot START
%-------------------------------------------------------------------------

size_frame=size(data_cut);

  temporal_sum=sum(data_cut,2);
  
  find_sums=sum(temporal_sum,1);                    %guarantess the divided column is all 0
  indices=find(find_sums==0);
  find_mid=round( (1+length(indices))/2 );
  divide=indices(find_mid);
  
  left_foot=data_cut(:,:,1:divide);
  right_foot=data_cut(:,:,divide:size_frame(3));
  
  
  size_left=size(left_foot);
  size_right=size(right_foot);
   

%-------------------------------------------------------------------------
                   %Divide Left and Right Foot END
%-------------------------------------------------------------------------
  




size_frame=size(data_cut);
area=zeros(1,size_frame(2));
for t=1:size_frame(2)
    for i=1:size_frame(1)
        for j=1:10
            
            if data_cut(i,t,j)>0
                area(t)=area(t)+1;
            end
            
        end
    end
end
[dummy,click_t]=maxk(area,1);
%time_max=find(area==max(area));
others=ceil(rand(1,ntimes-1)*size_frame(2)-3);
click_t=[click_t, others];

%frame_max_contact = reshape(data_cut(:,click_t(1),:),[size_frame(1),size_frame(3)]);




% pt_estimate=zeros(4,2,length(click_t));
% fprintf("You will click ... times")
% length(click_t)
% for i=1:length(click_t)
%     
%     frame_to_show = reshape(data_cut(:,click_t(i),:),[size_frame(1),size_frame(3)]);
%     figure
%     title("Choose Points and Click Enter")
%     imshow(frame_to_show,'InitialMagnification','fit')
%     [pt_estimate(:,2,i),pt_estimate(:,1,i)]=getpts;
% end
% close all

%points=sum(pt_estimate,3)/length(click_t);


%-------------------------------------------------------------------------
                   %Find Critical Point END
%-------------------------------------------------------------------------

%-------------------------------------------------------------------------
                   %Find 6 Regions START
%-------------------------------------------------------------------------

%Left Foot

x1=points(1,1);
y1=points(1,2);
x2=points(2,1);
y2=points(2,2);

a1= x1 +   (x2-x1)/(3);
a2= x1 + 2*(x2-x1)/(3);
b1= y1 +   (y2-y1)/(3);
b2= y1 + 2*(y2-y1)/(3);

lin1=@(y) (y-b1+(x1-x2)/(y2-y1)*a1) / ( (x1-x2)/(y2-y1) );
lin2=@(y) (y-b2+(x1-x2)/(y2-y1)*a2) / ( (x1-x2)/(y2-y1) );

maskFL=zeros(size_frame(1),size_frame(3));

for j=1:size_left(3)
   for i=1:1:lin1(j)

    
        maskFL(i,j)=1; 
        
    end
end


maskML=zeros(size_frame(1),size_frame(3));

for j=1:size_left(3)
    for i=ceil(lin1(j)):lin2(j)

        maskML(i,j)=1;  
    
    end
end

maskHL=zeros(size_frame(1),size_frame(3));

for j=1:size_left(3)
    for i=ceil(lin2(j)):size_left(1)

        maskHL(i,j)=1;  
    
    end
end


%Right Foot

x1=points(3,1);
y1=points(3,2);
x2=points(4,1);
y2=points(4,2);

a3= x1 +   (x2-x1)/(3);
a4= x1 + 2*(x2-x1)/(3);
b3= y1 +   (y2-y1)/(3);
b4= y1 + 2*(y2-y1)/(3);

lin3=@(y) (y-b3+(x1-x2)/(y2-y1)*a3) / ( (x1-x2)/(y2-y1) );
lin4=@(y) (y-b4+(x1-x2)/(y2-y1)*a4) / ( (x1-x2)/(y2-y1) );

maskFR=zeros(size_frame(1),size_frame(3));

for j=size_left(3)+1:size_frame(3)
   for i=1:1:lin3(j)

    
        maskFR(i,j)=1; 
        
    end
end


maskMR=zeros(size_frame(1),size_frame(3));

for j=size_left(3):size_frame(3)
    for i=ceil(lin3(j)):lin4(j)

        maskMR(i,j)=1;  
    
    end
end

maskHR=zeros(size_frame(1),size_frame(3));

for j=size_left(3):size_frame(3)
    for i=ceil(lin4(j)):size_left(1)

        maskHR(i,j)=1;  
    
    end
end

%  for t=1:size_frame(2)
%    t 
%  
%  data_cut_dummy(:,:)=data_cut(:,t,:);
%  
%  FL(:,t,:)=maskFL.*data_cut_dummy;
%  ML(:,t,:)=maskML.*data_cut_dummy;
%  HL(:,t,:)=maskHL.*data_cut_dummy;
%  FR(:,t,:)=maskFR.*data_cut_dummy;
%  MR(:,t,:)=maskMR.*data_cut_dummy;
%  HR(:,t,:)=maskHR.*data_cut_dummy;

%  end
FL=data_cut;
for i=1:size_frame(1)
    for j=1:size_frame(3)
           if maskFL(i,j)==0
              FL(i,:,j)=0;  
           end
    end
end

FR=data_cut;
for i=1:size_frame(1)
    for j=1:size_frame(3)
           if maskFR(i,j)==0
              FR(i,:,j)=0;  
           end
    end
end

ML=data_cut;
for i=1:size_frame(1)
    for j=1:size_frame(3)
           if maskML(i,j)==0
              ML(i,:,j)=0;  
           end
    end
end

MR=data_cut;
for i=1:size_frame(1)
    for j=1:size_frame(3)
           if maskMR(i,j)==0
              MR(i,:,j)=0;  
           end
    end
end

HL=data_cut;
for i=1:size_frame(1)
    for j=1:size_frame(3)
           if maskHL(i,j)==0
              HL(i,:,j)=0;  
           end
    end
end

HR=data_cut;
for i=1:size_frame(1)
    for j=1:size_frame(3)
           if maskHR(i,j)==0
              HR(i,:,j)=0;  
           end
    end
end

%  figure
%  for i=1:size_frame(2)
% 
%     frame_plot = reshape(FL(:,i,:),[size_frame(1),size_frame(3)]);
%     image(frame_plot,'CDataMapping','scaled')
%     pause(0.01)
% 
%  end



end