clc, clear all
close all
% Read all the data

% REMOVED CASE113 0620-2022
X = readmatrix('all_simu_data_1208','Sheet','train+test','Range','C3:G318');  % input cargo, speeds, weight, capacity
Y = readmatrix('all_simu_data_1208','Sheet','train+test','Range','I3:I318','OutputType','string');% output
Z = zscore(X);      % STANDARIZED
XTest=Z(1:63,:)     
YTest=Y(1:63,:)
Xtrainval=Z(64:316,:)
Ytrainval=Y(64:316,:)%在Excel里面随机划分为80%和20%的数据集
% Build new training set and testing set. 
rng("default") % For reproducibility of the partition
cvp = cvpartition(Ytrainval,"Holdout",0.25); % 80% for training, 20% for testing.(random selected)
XTrain = Xtrainval(training(cvp),:);
YTrain = Ytrainval(training(cvp));
XVal = Xtrainval(test(cvp),:);
YVal = Ytrainval(test(cvp));%将剩下的80%的数据分为60%和20%分别作为训练集和验证集

%% Try different kernel functions
% 1 - linear kernel; 2 - gaussain kernel; 3 - polynomial kernel.
Md1 = linearKernel(XTrain,YTrain);
Md2 = gaussainKernel(XTrain,YTrain);
Md3 = polyKernel(XTrain,YTrain);


loss_Md1_test = loss(Md1,XTest,YTest)
loss_Md2_test = loss(Md2,XTest,YTest)
loss_Md3_test = loss(Md3,XTest,YTest)

loss_Md1_Val = loss(Md1,XVal,YVal)
loss_Md2_Val = loss(Md2,XVal,YVal)
loss_Md3_Val = loss(Md3,XVal,YVal)

loss_Md1_train = loss(Md1,XTrain,YTrain)
loss_Md2_train = loss(Md2,XTrain,YTrain)
loss_Md3_train = loss(Md3,XTrain,YTrain)

% genError1 = resubLoss(Md1);%holdout交叉验证Md1的误差
% genError2 = resubLoss(Md2);%holdout交叉验证Md2的误差
% genError3 = resubLoss(Md3);%holdout交叉验证Md3的误差

% figure
% subplot(1,3,1)
% cm1 = confusionchart(cellstr(YTest),predict(Md1,XTest));
% sortClasses(cm1,["minor","severe","collapse"])
% cm1.Title = 'linear function';
% cm1.RowSummary = 'row-normalized';
% cm1.ColumnSummary = 'column-normalized';
% subplot(1,3,2)
% cm2 = confusionchart(cellstr(YTest),predict(Md2,XTest));
% sortClasses(cm2,["minor","severe","collapse"])
% cm2.Title = 'gaussian function';
% cm2.RowSummary = 'row-normalized';
% cm2.ColumnSummary = 'column-normalized';
% subplot(1,3,3)
% cm3 = confusionchart(cellstr(YTest),predict(Md3,XTest));
% sortClasses(cm3,["minor","severe","collapse"])
% cm3.Title = 'polynomial function';
% cm3.RowSummary = 'row-normalized';
% cm3.ColumnSummary = 'column-normalized';
% saveas(gcf,'train.tif')

% loss_Md1_test = loss(Md1,XTest,YTest)
% loss_Md2_test = loss(Md2,XTest,YTest)
% loss_Md3_test = loss(Md3,XTest,YTest)

% CONFUSION CHART FOR Testing DATA SEPARATE CHART



figure
cm1 = confusionchart(cellstr(YTest),predict(Md1,XTest),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm1,["MD","SD","F"])
% cm1.Title = 'linear function';
saveas(gcf,'CM_linear_test.tif')

figure
cm2 = confusionchart(cellstr(YTest),predict(Md2,XTest),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm2,["MD","SD","F"])
% cm2.Title = 'gaussian function';
saveas(gcf,'CM_gaussain_test.tif')

figure
cm3 = confusionchart(cellstr(YTest),predict(Md3,XTest),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm3,["MD","SD","F"])
% cm3.Title = 'polynomial function';
saveas(gcf,'CM_polynomial_test.tif')




% figure
% subplot(1,3,1)
% cm1 = confusionchart(cellstr(YVal),predict(Md1,XVal));
% sortClasses(cm1,["minor","severe","collapse"])
% cm1.Title = 'linear function';
% cm1.RowSummary = 'row-normalized';
% cm1.ColumnSummary = 'column-normalized';
% subplot(1,3,2)
% cm2 = confusionchart(cellstr(YVal),predict(Md2,XVal));
% sortClasses(cm2,["minor","severe","collapse"])
% cm2.Title = 'gaussian function';
% cm2.RowSummary = 'row-normalized';
% cm2.ColumnSummary = 'column-normalized';
% subplot(1,3,3)
% cm3 = confusionchart(cellstr(YVal),predict(Md3,XVal));
% sortClasses(cm3,["minor","severe","collapse"])
% cm3.Title = 'polynomial function';
% cm3.RowSummary = 'row-normalized';
% cm3.ColumnSummary = 'column-normalized';
% saveas(gcf,'train.tif')


figure
cm1 = confusionchart(cellstr(YVal),predict(Md1,XVal),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm1,["MD","SD","F"])
% cm1.Title = 'linear function';
saveas(gcf,'CM_linear_Val.tif')

figure
cm2 = confusionchart(cellstr(YVal),predict(Md2,XVal),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm2,["MD","SD","F"])
% cm2.Title = 'gaussian function';
saveas(gcf,'CM_gaussain_Val.tif')

figure
cm3 = confusionchart(cellstr(YVal),predict(Md3,XVal),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm3,["MD","SD","F"])
% cm3.Title = 'polynomial function';
saveas(gcf,'CM_polynomial_Val.tif')





% % CROSS-VALIDATION OF THE TRAINING DATASET
% rng('default') % For reproducibility
% CVMd1 = crossval(Md1);
% classLoss1 = kfoldLoss(CVMd1)
% % rng('default') % For reproducibility
% CVMd2 = crossval(Md2);
% classLoss2 = kfoldLoss(CVMd2)
% % rng('default') % For reproducibility
% CVMd3 = crossval(Md3);
% classLoss3 = kfoldLoss(CVMd3)

% CONFUSION CHART FOR TRAINING DATA
% figure
% subplot(1,3,1)
% cm1 = confusionchart(cellstr(YTrain),predict(Md1,XTrain));
% sortClasses(cm1,["minor","severe","collapse"])
% cm1.Title = 'linear function';
% cm1.RowSummary = 'row-normalized';
% cm1.ColumnSummary = 'column-normalized';
% subplot(1,3,2)
% cm2 = confusionchart(cellstr(YTrain),predict(Md2,XTrain));
% sortClasses(cm2,["minor","severe","collapse"])
% cm2.Title = 'gaussian function';
% cm2.RowSummary = 'row-normalized';
% cm2.ColumnSummary = 'column-normalized';
% subplot(1,3,3)
% cm3 = confusionchart(cellstr(YTrain),predict(Md3,XTrain));
% sortClasses(cm3,["minor","severe","collapse"])
% cm3.Title = 'polynomial function';
% cm3.RowSummary = 'row-normalized';
% cm3.ColumnSummary = 'column-normalized';
% loss_Md1_train = loss(Md1,XTrain,YTrain)
% loss_Md2_train = loss(Md2,XTrain,YTrain)
% loss_Md3_train = loss(Md3,XTrain,YTrain)

% CONFUSION CHART FOR TRAINING DATA SEPARATE
figure
cm1 = confusionchart(cellstr(YTrain),predict(Md1,XTrain),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm1,["MD","SD","F"])
% cm1.Title = 'linear function';
saveas(gcf,'CM_linear_train.tif')

figure
cm2 = confusionchart(cellstr(YTrain),predict(Md2,XTrain),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm2,["MD","SD","F"])
% cm2.Title = 'gaussian function';
saveas(gcf,'CM_gaussain_train.tif')

figure
cm3 = confusionchart(cellstr(YTrain),predict(Md3,XTrain),...
    'FontName','Times New Roman','FontSize',16,'RowSummary','row-normalized',...
    'ColumnSummary','column-normalized');
sortClasses(cm3,["MD","SD","F"])
% cm3.Title = 'polynomial function';
saveas(gcf,'CM_polynomial_train.tif')


