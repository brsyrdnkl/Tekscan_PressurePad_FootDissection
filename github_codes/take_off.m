function [flights]=take_off(input)

size_frame=size(input);

for t=1:size_frame(2)
    weight(t)=sum(sum(input(:,t,:)));
end

flights=find(weight==0);
diff_flights=diff(flights);
critical_points=find(abs(diff_flights)==1);


foot_up=flights(critical_points);

end