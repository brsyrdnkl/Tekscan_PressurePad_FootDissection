function [L,R]= find_leftright(x)


size_frame=size(x);

for i=1:size_frame(3)
LR(i)=sum(sum(x(:,:,i)));
end


zeros_col=find(LR==0);
mid_zeros=round(length(zeros_col)/2);
boundry=zeros_col(mid_zeros);


L=x(:,:,1:boundry);
R=x(:,:,boundry+1:size_frame(3));

size_L=size(L);
size_R=size(R);

zeros_L=zeros(size_R(1),size_R(2),size_R(3));
zeros_R=zeros(size_L(1),size_L(2),size_L(3));

L=cat(3,L,zeros_L);
R=cat(3,zeros_R,R);

end