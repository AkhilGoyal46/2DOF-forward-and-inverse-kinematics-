clear all
clc

t=0:0.01:10;

a1=0
b1=1.7
c1=0.2

a2=0
b2=0
c2=0.1

theta1 = a1 + b1*t + c1*t.^2;
theta2 = a2 + b2*t + c2*t.^2;

% foraward kinematics
% forward kinematics
X1= @(theta_1) sin(theta_1); % with respect to general coordinate frame
Y1 =@(theta_1) -cos(theta_1); % with respect to general coordinate frame

X2 =@(theta_1,theta_2) sin(theta_1)+sin(theta_2); % with respect ot general coordinate frame
Y2 =@(theta_1,theta_2) -cos(theta_1)-cos(theta_2); % with respect ot general coordinate frame


x1= X1(theta1);
y1= Y1(theta1);
x2= X2(theta1,theta2);
y2= Y2(theta1,theta2);



for i=1:size(t,2)
plot(2*cos(0:0.1:2*pi),2*sin(0:0.1:2*pi),"y") % plotting workspace
hold on

plot([-0.25 0.25],[0 0],"k")

plot(x2(1:i),y2(1:i),"r") %plotting path for end effector

plot([0 x1(i)],[0 y1(i)],'b') % ploting first link
plot([x1(i) x2(i)],[y1(i) y2(i)],"g") % ploting second link

hold off
pause(0.001)
end

 


    