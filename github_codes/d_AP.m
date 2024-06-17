function [cm_AP, pressure]= d_AP(data)
size_frame=size(data);
row_sum_data=sum(data,3);

for t=1:size_frame(2)
    pressure(t)=sum(sum(data(:,t,:)));
end

cm_AP=zeros(1,size_frame(2));

    for t=1:size_frame(2)
        for i=1:size_frame(1)
        cm_AP(t)=cm_AP(t)+row_sum_data(i,t)*(size_frame(1)+1-i)/pressure(t);
        end
    end
end
