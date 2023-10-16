function [Md1] = linearKernel(XTrain,YTrain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
rng(1); % For reproducibility 
t1 = templateSVM('Standardize',true,'KernelFunction','linear','BoxConstraint',5,'KernelScale','auto');
Md1 = fitcecoc(XTrain,YTrain,'Learners',t1);
% Md1 = fitcecoc(XTrain,YTrain,'Learners',t1,'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct("Holdout",0.25,'AcquisitionFunctionName',...
%     'expected-improvement-plus'));
end

