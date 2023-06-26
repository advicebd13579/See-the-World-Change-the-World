%% Create Figure Window 
% This code creates a figure window to view the world
figure
axis equal
ax = gca;
ax.Box = 'on';
ax.XLim = [-180 180];
ax.YLim = [-90 90];
xlabel('longitude')
ylabel('latitude')
title('See the World')

%% Display Continents
% This code draws the continents on the figure window
worldmap('world')
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', [.9 .9 .9])

%% Read in Urban Areas
% This code reads in and extracts urban area coordinates
urban = shaperead('worldcities', 'UseGeoCoords', true);

%% Overlay Urban Areas
% This code overlays the coordinates of urban areas on the figure window
sz = arrayfun(@(x) 3*x.Area, urban);
geoshow(ax, urban, 'Marker', 'o', 'MarkerSize', sz, ...
        'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');

%% Create World Time Zones
% This code creates the boundaries of world time zones
timemap('TimeZoneBoundaries', 'UseGeoCoords', true);

%% Show Major Cities
% This code labels the major cities on the figure window
cities = {'New York', 'London', 'Berlin', 'Paris', 'Johannesburg'};
[latitudes, longitudes] = getcitycoordinates(cities);
textm(latitudes, longitudes, cities, 'HorizontalAlignment', 'right');

%% Read in Political Borders
% This code reads in and extracts political boundary coordinates
pborder = shaperead('worldborders', 'UseGeoCoords', true);

%% Draw Political Borders
% This code draws the political boundaries on the figure window
geoshow(ax, pborder, 'Color', 'k');