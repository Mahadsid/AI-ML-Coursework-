if (Epoch > 1)
    for n =1:1:no_of_inputs
        w(1,n) = w(m+1,n);
    end
end

i = 1;
j = 1;
fprintf('\nEpoch = %d',Epoch);

for Iteration = 1:1:row_of_possible_inputs
    fprintf('\nIteration = %d\n',Iteration);

for n = 1:1:no_of_inputs
    wx = w(i,n) * x(i,n) + wx;
end


s = b + wx;
wx = 0;

 if (s > theta)
     y=1;
 elseif ((s >= (-theta)) && (s <= theta))
     y=0;
 else (s < (-theta));
     y=-1;
 end
 
 
 for n = 1:1:no_of_inputs
     
     if (y ~= t(i,1))
         w(i+1,n) = w(i,n) + (a*t(i,1)*x(i,n));
     else 
         w(i+1,n) = w(i,n);
     end  
 end
 
 if (y~=t(i,1))
    b = b + (a*t(i,1));
 else
 end
 
 i = i + 1;
 j = j + 1;
 fprintf('s = %.2f \ty = %d\tb = %.2f\n',s,y,b);
end
Epoch = Epoch + 1;
         