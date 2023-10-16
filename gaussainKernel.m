function [Md2] = gaussainKernel(XTrain,YTrain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
rng(1); % For reproducibility 
t2 = templateSVM('Standardize',true,'KernelFunction','gaussian','BoxConstraint',1,'KernelScale','auto');
Md2 = fitcecoc(XTrain,YTrain,'Learners',t2);
end

