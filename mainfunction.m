clc;
clear all;
close all;
%enter cost matrix
%if there are generator limits use the mwlimits variable
%if there any lossess given, use the B variable
%to input base MVA use the basemava variable
clc;
clear all;
close all;
m=3;
nn=input("enter no of generators=\n");
cost=zeros(nn,3);
for i =1:1:nn
    for j=1:1:3
        cost(i,j)=input("write the cost equation co-efficients\n");
    end
end
mwlimits=zeros(nn,2); 
for i =1:1:nn 
    for j=1:1:2 

        mwlimits(i,j)=input("write the real power limits \n"); 

    end 

end 

disp(mwlimits) 
disp(cost)
A=[]; % incremental cost
B1=[]; % gen of G1
C1=[]; % gen of g2
D=[]; % Total cost
F=[]; % sample power demand
E1=[];
G1=[];
for i=0:1:23
    
    Dispatch1r2
    F=[F Pdt1]
    A=[A lambda]
    B1=[B1 Pgg(1,1)]
    C1=[C1 Pgg(1,2)]
    if nn==3
    E1=[E1 Pgg(1,3)]
    end
    if nn==4
    E1=[E1 Pgg(1,3)]
    G1=[G1 Pgg(1,4)]
    end
    Gencost1r2
    D=[D totalcost]
end
disp(A)
disp(F)
disp(B1)
disp(C1)
disp(D)
%time period of 24 hours
time_period=[0:1:23];
subplot(2,2,1)
%given power demand (24 values)
stem(time_period,F)
grid on
box on
xlabel("Hours")
ylabel("Power Demand(in MW)")
title("Sample Power Demand of a day")
%generation cost for each hour
subplot(2,2,2)
plot(time_period,D)
grid on
box on
xlabel("Hours")
ylabel("Generation cost(in ($) )")
title("Generation cost for each hour")
subplot(2,2,3)
%incremental cost for each hour
plot(time_period,A)
grid on
box on
xlabel("Hours")
ylabel("λ($/MWh)")
title("Incremental cost of delivered power")
if nn ==2
%economic dispatch for each hour(gen1,gen2)
subplot(2,2,4)
plot(time_period,B1,'linewidth',1.5)
hold on
plot(time_period,C1,'linewidth',1.5)
grid on
box on
xlabel("Hours")
ylabel("Power dispatch(in MW)")
title("Economic Load Dispatch")
end
if nn==4
 %economic dispatch for each hour(gen1,gen2,gen3,gen4)
 subplot(2,2,4)
 plot(time_period,B1,'linewidth',1.5)
 hold on
 plot(time_period,C1,'linewidth',1.5)
 hold on
 plot(time_period,E1,'linewidth',1.5)
 hold on
 plot(time_period,G1,'linewidth',1.5)
 hold on
 grid on
 box on
 xlabel("Hours")
 ylabel("Power dispatch(in MW)")
 title("Economic Load Dispatch")
end
if nn==3
 %economic dispatch for each hour(gen1,gen2,gen3)
 subplot(2,2,4)
 plot(time_period,B1,'linewidth',1.5)
 hold on
 plot(time_period,C1,'linewidth',1.5)
 hold on
 plot(time_period,E1,'linewidth',1.5)
 hold on
 grid on
 box on
 xlabel("Hours")
 ylabel("Power dispatch(in MW)")
 title("Economic Load Dispatch")
end