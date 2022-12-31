%% 此程序为matlab编程实现的BP神经网络
% 清空环境变量
clear
close all
clc

%  A = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','M2:M10000');
%  B = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','N2:N10000');
%  A1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','M2:M10000');
%  B1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','N2:N10000');

 A = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','O2:O8000');
 B = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','P2:P8000');
 A1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','O2:O8000');
 B1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','P2:P8000');

% A = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','B2:B12934');
% B = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','D2:D12934');
% C = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','F2:F12934');
% D = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','G2:G12934');
% E = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','H2:H12934');
% F = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','I2:I12934');
% G = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','J2:J12934');
% H = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','K2:K12934');
% I = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','L2:L80639');
% A1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','B2:B12934');
% B1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','D2:D12934');
% C1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','F2:F12934');
% D1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','G2:G12934');
% E1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','H2:H12934');
% F1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','I2:I12934');
% G1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','J2:J12934');
% H1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','K2:K12934');
% I1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','L2:L80639');
% A = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','B2:B1293');
% B = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','D2:D1293');
% C = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','F2:F1293');
% D = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','G2:G1293');
% E = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','H2:H1293');
% F = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','I2:I1293');
% G = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','J2:J1293');
% H = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','K2:K1293');
% I = readmatrix('force.xlsx','Sheet','soft-V40W180_force','Range','L2:L1293');
% A1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','B2:B1293');
% B1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','D2:D1293');
% C1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','F2:F1293');
% D1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','G2:G1293');
% E1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','H2:H1293');
% F1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','I2:I1293');
% G1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','J2:J1293');
% H1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','K2:K1293');
% I1 = readmatrix('disp.xlsx','Sheet','soft-V40W180_force','Range','L2:L1293');
% A=zscore(A)
% B=zscore(B)
% C=zscore(C)
% D=zscore(D)
% E=zscore(E)
% F=zscore(F)
% G=zscore(G)
% H=zscore(H)
% I=zscore(I)
% A1=categorical(A1)
% B1=categorical(B1)
% C1=categorical(C1)
% D1=categorical(D1)
% E1=categorical(E1)
% F1=categorical(F1)
% G1=categorical(G1)
% H1=categorical(H1)
% I1=categorical(I1)
% XTrain1=[A;B;C;D;E;F;G;H]
XTest=[B]
% num1=size(XTrain)
% num11=size(XTrain1)
% XTrain=XTrain(:)
% YTrain1=[A1;B1;C1;D1;E1;F1;G1;H1]
YTest=[B1]
% num2=size(YTrain)
% num22=size(YTrain1)
an=sim(net,XTest);
test_simu = an
output_test = YTest
error=test_simu-output_test; 
figure
plot(output_test,'g')
hold on
plot(test_simu,'r')
hold on
% plot(error,'square','MarkerFaceColor','b')
plot(error,'b')
legend('期望值','预测值','误差')
xlabel('数据组数')
ylabel('样本值')
title('BP神经网络测试集的预测值与实际值对比图')
