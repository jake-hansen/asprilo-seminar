%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grid Size X:                      7
% Grid Size Y:                      6
% Number of Nodes:                  42
% Number of Highway Nodes:          30
% Number of Robots:                 3
% Number of Shelves:                6
% Number of Picking Stations:       1
% Number of Products:               12
% Number of Product Units in Total: 24
% Number of Orders:                 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#program base.

% init
init(object(highway,1),value(at,(1,1))).
init(object(highway,2),value(at,(2,1))).
init(object(highway,3),value(at,(3,1))).
init(object(highway,5),value(at,(5,1))).
init(object(highway,6),value(at,(6,1))).
init(object(highway,7),value(at,(7,1))).
init(object(highway,8),value(at,(1,2))).
init(object(highway,9),value(at,(2,2))).
init(object(highway,10),value(at,(3,2))).
init(object(highway,11),value(at,(4,2))).
init(object(highway,12),value(at,(5,2))).
init(object(highway,13),value(at,(6,2))).
init(object(highway,14),value(at,(7,2))).
init(object(highway,15),value(at,(1,3))).
init(object(highway,18),value(at,(4,3))).
init(object(highway,21),value(at,(7,3))).
init(object(highway,22),value(at,(1,4))).
init(object(highway,25),value(at,(4,4))).
init(object(highway,28),value(at,(7,4))).
init(object(highway,29),value(at,(1,5))).
init(object(highway,30),value(at,(2,5))).
init(object(highway,31),value(at,(3,5))).
init(object(highway,32),value(at,(4,5))).
init(object(highway,33),value(at,(5,5))).
init(object(highway,34),value(at,(6,5))).
init(object(highway,35),value(at,(7,5))).
init(object(highway,39),value(at,(4,6))).
init(object(highway,40),value(at,(5,6))).
init(object(highway,41),value(at,(6,6))).
init(object(highway,42),value(at,(7,6))).
init(object(node,1),value(at,(1,1))).
init(object(node,2),value(at,(2,1))).
init(object(node,3),value(at,(3,1))).
init(object(node,4),value(at,(4,1))).
init(object(node,5),value(at,(5,1))).
init(object(node,6),value(at,(6,1))).
init(object(node,7),value(at,(7,1))).
init(object(node,8),value(at,(1,2))).
init(object(node,9),value(at,(2,2))).
init(object(node,10),value(at,(3,2))).
init(object(node,11),value(at,(4,2))).
init(object(node,12),value(at,(5,2))).
init(object(node,13),value(at,(6,2))).
init(object(node,14),value(at,(7,2))).
init(object(node,15),value(at,(1,3))).
init(object(node,16),value(at,(2,3))).
init(object(node,17),value(at,(3,3))).
init(object(node,18),value(at,(4,3))).
init(object(node,19),value(at,(5,3))).
init(object(node,20),value(at,(6,3))).
init(object(node,21),value(at,(7,3))).
init(object(node,22),value(at,(1,4))).
init(object(node,23),value(at,(2,4))).
init(object(node,24),value(at,(3,4))).
init(object(node,25),value(at,(4,4))).
init(object(node,26),value(at,(5,4))).
init(object(node,27),value(at,(6,4))).
init(object(node,28),value(at,(7,4))).
init(object(node,29),value(at,(1,5))).
init(object(node,30),value(at,(2,5))).
init(object(node,31),value(at,(3,5))).
init(object(node,32),value(at,(4,5))).
init(object(node,33),value(at,(5,5))).
init(object(node,34),value(at,(6,5))).
init(object(node,35),value(at,(7,5))).
init(object(node,36),value(at,(1,6))).
init(object(node,37),value(at,(2,6))).
init(object(node,38),value(at,(3,6))).
init(object(node,39),value(at,(4,6))).
init(object(node,40),value(at,(5,6))).
init(object(node,41),value(at,(6,6))).
init(object(node,42),value(at,(7,6))).
init(object(order,1),value(line,(10,1))).
init(object(order,1),value(line,(12,1))).
init(object(order,1),value(pickingStation,1)).
init(object(order,2),value(line,(9,1))).
init(object(order,2),value(line,(12,1))).
init(object(order,2),value(pickingStation,1)).
init(object(order,3),value(line,(1,1))).
init(object(order,3),value(line,(11,1))).
init(object(order,3),value(pickingStation,1)).
init(object(pickingStation,1),value(at,(4,1))).
init(object(product,1),value(on,(4,2))).
init(object(product,2),value(on,(1,2))).
init(object(product,3),value(on,(2,2))).
init(object(product,4),value(on,(1,2))).
init(object(product,5),value(on,(6,2))).
init(object(product,6),value(on,(4,2))).
init(object(product,7),value(on,(3,2))).
init(object(product,8),value(on,(5,2))).
init(object(product,9),value(on,(3,2))).
init(object(product,10),value(on,(2,2))).
init(object(product,11),value(on,(6,2))).
init(object(product,12),value(on,(5,2))).
init(object(robot,1),value(at,(1,6))).
init(object(robot,2),value(at,(2,6))).
init(object(robot,3),value(at,(3,6))).
init(object(robot,1),value(energy,30)).
init(object(robot,2),value(energy,40)).
init(object(robot,3),value(energy,50)).
init(object(shelf,1),value(at,(3,3))).
init(object(shelf,2),value(at,(6,3))).
init(object(shelf,3),value(at,(2,4))).
init(object(shelf,4),value(at,(3,4))).
init(object(shelf,5),value(at,(5,4))).
init(object(shelf,6),value(at,(6,4))).
