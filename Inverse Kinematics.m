clear all
clc

h= 0;
k= -0.2;
r=1.5;

%x_start= h - r;
%y_start= k;
%x_stop = h - r;
%y_stop = k + 0.1; 

%a=atan2d(y_start,x_start) 
%b=atan2d(y_stop , x_stop)



theta = -pi: 0.01 :pi;

% foraward kinematics
X1= @(theta_1) cos(theta_1); % with respect to general coordinate frame
Y1 =@(theta_1) sin(theta_1); % with respect to general coordinate frame

X2 =@(theta_1,theta_2) cos(theta_1)+cos(theta_2); % with respect ot general coordinate frame
Y2 =@(theta_1,theta_2) sin(theta_1)+sin(theta_2); % with respect ot general coordinate frame

% equation of the cirle with offset  h&k and radius r in terms x 
%(x-h)^2 + (y-k)^2 = r^2

x= r*cos(theta)+h;
y= r*sin(theta)+k;

theta1=   acos(0.5*(x.^2+y.^2).^0.5) + atan2(y,x) ; % with respect to x-axis
theta2=   -acos(0.5*(x.^2+y.^2).^0.5) + atan2(y,x) ;  % with respect to x-axis

x1= X1(theta1);
y1= Y1(theta1);
x2= X2(theta1,theta2);
y2= Y2(theta1,theta2);

for i=1:size(theta,2)
plot(2*cos(0:0.1:2*pi),2*sin(0:0.1:2*pi),"y") % plotting workspace
hold on
plot([-0.25 0.25],[0 0],"k")
plot(x,y,"r") %plotting path for end effector
plot([0 x1(i)],[0 y1(i)],'b') % ploting fist link
plot([x1(i) x2(i)],[y1(i) y2(i)],"g") % ploting second link

hold off
pause(0.01)
end




 


    