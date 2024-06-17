function data_cut=cut(data) %this function cuts off the pixels that are 
                            %empty for the whole time

T=size(data,2);             %T is temporal length of the data
timesum(:,:)=sum(data,2);   %First sum the frames over time to see the   
                            %pixels for all t<T
rowsum=sum(timesum,2);      %Rowsum checks the 0 rows to be deleted
columnsum=sum(timesum,1);   %similarly check the empty columns to delete
sz_ap=size(data,1);         %to employ a "while" you need to find total 
                            %number of rows and cols
sz_ml=size(data,3);

i=1;                        %A_bound finds the most anterior row that is 
                            %the frontal bound of the foot
rowsum_lower=0;
while rowsum_lower<1
   rowsum_lower=rowsum(i);
   i=i+1;
end
A_bound=i-1;

i=0;
rowsum_upper=0;
while rowsum_upper<1
   rowsum_upper=rowsum(sz_ap-i);
   i=i+1;
end
P_bound=sz_ap-i+1;          %Similarly this is the posterior bound of the 
                            %foot that is the last nonzero row

i=1;
columnsum2=0;
while columnsum2<1
   columnsum2=columnsum(i);
   i=i+1;
end
L_bound=i-1;                %Same for left most column

i=0;
columnsum3=0;
while columnsum3<1
   columnsum3=columnsum(sz_ml-i);
   i=i+1;
end
R_bound=sz_ml-i+1;          %finally right most column is found as R_bound

data_cut=data(A_bound:P_bound,:,L_bound:R_bound);   %Then cut the data 
                                   %according to all four bounds for 
                                   %computational efficiency

timesum_cut(:,:)=sum(data_cut,2);             %At the end sum over the time                             
figure                                        %then visualize the cut frame
image(timesum_cut/4500,'CDataMapping','scaled')



end
