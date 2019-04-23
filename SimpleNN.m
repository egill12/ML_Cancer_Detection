% from the lab 2 
% this is not iteratable, its called one shot learning.. very efficient but
% not accurate
X = [-1,-1;-1,+1;+1,-1,;+1,+1]
Y = [-1;-1;+1;-1]
% initial weights
W = transpose(X)*Y
% using hardlims function
z = -5:0.1:5
plot(z,hardlims(z))
%classification of the X using weights W, and mapping to hardlims
classification = (X*(W))  
% using hardlims as activation, 1st iteration
mapping = hardlims(classification)  % adding bias
% how wrong were we?
error = mapping -Y
