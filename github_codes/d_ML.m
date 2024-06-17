function [cm_ML, pressure]= d_ML(data)
size_frame=size(data);
col_sum_data=sum(data,1);

for t=1:size_frame(2)
    pressure(t)=sum(sum(data(:,t,:)));
end

cm_ML=zeros(1,size_frame(2));

    for t=1:size_frame(2)
        for i=1:size_frame(3)
        cm_ML(t)=cm_ML(t)+col_sum_data(1,t,i)*i/pressure(t);
        end
    end
end