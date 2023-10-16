function [Md3] = polyKernel(XTrain,YTrain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
rng(1); % For reproducibility 
t3 = templateSVM('Standardize',true,'KernelFunction','polynomial','BoxConstraint',1,'KernelScale','auto','PolynomialOrder',2);

 Md3 = fitcecoc(XTrain,YTrain,'Learners',t3);
%  Md3 = fitcecoc(XTrain,YTrain,'Learners',t3,'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));
end

