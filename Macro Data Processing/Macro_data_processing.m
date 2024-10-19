%%
% Monetary Theory and Policy
% Part I: In Class


clear all
clc
load('Greece_data')

greek_data=Greece_data.data;

%%
% Step 1: Construct a figure with CLV 2010=100

figure(1)
subplot(2,2,1)
plot(greek_data(:,1))
title(Greece_data.names{1}, 'Interpreter', 'latex', 'FontSize', 14);
hold on
grid on
subplot(2,2,2)
plot(greek_data(:,2))
title(Greece_data.names{2}, 'Interpreter', 'latex', 'FontSize', 14);
hold on
grid on
subplot(2,2,3)
plot(greek_data(:,3))
title(Greece_data.names{3}, 'Interpreter', 'latex', 'FontSize', 14);
hold on
grid on

%%
% Add quarter labels in the x-axis
% Range of years and quarters

years = 1995:2021;
quarters = repmat({'Q1', 'Q2', 'Q3', 'Q4'}, 1, length(years));

%X axis labels
x_labels = strcat(repelem(string(years), 4), ' ', quarters);
quarters_numeric = 1:length(x_labels); 

for jj=1:3
    figure(1)
    subplot(2,2,jj)
    
% Assign to the x-axis ticks and labels for every 8 quarters
xticks(1:8:length(quarters_numeric)); 
xticklabels(x_labels(1:8:end));        
xtickangle(45);  

xlim([1 length(quarters_numeric)]);

end

%%
%Taking logs
greek_data=log(greek_data);
figure(2)
subplot(2,2,1)
plot(greek_data(:,1))
title(Greece_data.names{1}, 'Interpreter', 'latex', 'FontSize', 14);
hold on
grid on
subplot(2,2,2)
plot(greek_data(:,2))
title(Greece_data.names{2}, 'Interpreter', 'latex', 'FontSize', 14);
hold on
grid on
subplot(2,2,3)
plot(greek_data(:,3))
title(Greece_data.names{3}, 'Interpreter', 'latex', 'FontSize', 14);
hold on
grid on

%%
% Add labels in the x-axis

%%
% Apply HP filter to your data
theta=6;
[trend,cycle]=hpfilter(greek_data,100);
% [trend2,cycle2]=hpfilter(greek_data,100);
% [trend3,cycle3]=hpfilter(greek_data,10000);

figure(3)
plot(1:106,trend(:,1),1:106,greek_data(:,1))

legend('Trend, $\theta=6$', 'GDP','Interpreter', 'latex', 'FontSize', 14)
grid on
hold on

years = 1995:2021;
quarters = repmat({'Q1', 'Q2', 'Q3', 'Q4'}, 1, length(years));
%X axis labels
x_labels = strcat(repelem(string(years), 4), ' ', quarters);
quarters_numeric = 1:length(x_labels); 
xticks(1:8:length(quarters_numeric)); 
xticklabels(x_labels(1:8:end));        
xtickangle(45);  
xlim([1 length(quarters_numeric)]);
%%
figure(4)
plot(1:106,cycle(:,1:3))
title('Cyclical components','Interpreter', 'latex', 'FontSize', 14)
legend('GDP','Consumption','Investment','Interpreter', 'latex', 'FontSize', 14)
grid on
hold on
quarters = repmat({'Q1', 'Q2', 'Q3', 'Q4'}, 1, length(years));
%X axis labels
x_labels = strcat(repelem(string(years), 4), ' ', quarters);
quarters_numeric = 1:length(x_labels); 
xticks(1:8:length(quarters_numeric)); 
xticklabels(x_labels(1:8:end));        
xtickangle(45);  
xlim([1 length(quarters_numeric)]);
