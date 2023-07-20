1 % This is a program to see the world
2 clear;
3 clc;
4 close all;
5 
6 % Define image parameters
7 t = 0:0.1:2*pi;
8 x0 = 2;
9 y0 = 3;
10 z0 = 4;
11 
12 % Generate figure
13 figure;
14 hold on;
15 axis equal;
16 xlabel('x');
17 ylabel('y');
18 zlabel('z');
19 view([90, 90]);
20 
21 % Plot a sphere
22 x = x0 + cos(t);
23 y = y0 + sin(t);
24 z = z0 + zeros(size(t));
25 plot3(x, y, z);
26 
27 % Plot a loop
28 x = x0 + 2 * cos(t);
29 y = y0 + 2 * sin(t);
30 z = z0 + zeros(size(t));
31 plot3(x, y, z);
32 
33 % Plot a cross
34 x = x0 + zeros(size(t));
35 y = y0 + 2 * cos(t);
36 z = z0 + 2 * sin(t);
37 plot3(x, y, z);
38 
39 % Add some colors
40 colormap('summer');
41 c = linspace(0, 0.6, length(t));
42 c = 1-c;
43 h = scatter3(x, y, z, 50, c);
44 set(h, 'LineWidth', 2);
45 
46 % Add a star
47 x = x0 + 0.5 * cos(t);
48 y = y0 + 0.5 * sin(t);
49 z = z0 + 0.5 * zeros(size(t));
50 star = plot3(x, y, z);
51 set(star, 'LineWidth', 3);
52 
53 % Add a line
54 x = [x0, x0 + 2 * cos(t(end)), x0 + 2 * cos(t(1))];
55 y = [y0, y0 + 2 * sin(t(end)), y0 + 2 * sin(t(1))];
56 z = [z0, z0 + zeros(size(t(end))), z0 + zeros(size(t(1)))];
57 l1 = plot3(x, y, z);
58 set(l1, 'LineWidth', 4);
59 
60 % Add a second line
61 x = [x0 + 0.5 * cos(t(end)), x0 + 0.5 * cos(t(1))];
62 y = [y0 + 0.5 * sin(t(end)), y0 + 0.5 * sin(t(1))];
63 z = [z0 + 0.5 * zeros(size(t(end))), z0 + 0.5 * zeros(size(t(1)))];
64 l2 = plot3(x, y, z);
65 set(l2, 'LineWidth', 4);
66 
67 % Add a light
68 l = light('Position',[10 5 10]);
69 
70 % Add a title
71 title('See the World');