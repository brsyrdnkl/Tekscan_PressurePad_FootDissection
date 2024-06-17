function [signal, noisy]= eliminate_noise(x, BW)

size_frame=size(x);

noisy=x;
for i=1:size_frame(1)
    for j=1:size_frame(3)
        if BW(i,j)==0
            noisy(i,:,j)=0;
        end
    end
end

signal=x-noisy;

end