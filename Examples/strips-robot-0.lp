% Instructions
% ============
%
% Run this calling clingo this way,
%
% clingo \
%   -c k=6 \
%   --models 1 \
%   strips.lp \
%   strips-robot.lp \
%   strips-robot-0.lp

% Map
% ===
%
%  |----| |----|    |--------------+--------------|
%  | o1 | | o2 |    | meetingRoom1 | meetingRoom2 |
% ---d1-+-+-d2---||-------dm1------+-----dm2------|
%                ||                               |
%   hallway1     hD  hallway2                     |
%                ||                               |
% ---d3-+-+-d4---||--------dk------+-----dm3------|
%  | o3 | | o4 |     |   kitchen   | meetingRoom3 |
%  |----| |----|     |-------------+--------------|

connected(hallway1, office1, door1).
connected(hallway1, office2, door2).
connected(hallway1, office3, door3).
connected(hallway1, office4, door4).

connected(hallway1, hallway2, hallwayDoor).

connected(hallway2, meetingRoom1, doorMeetingRoom1).
connected(hallway2, meetingRoom2, doorMeetingRoom2).
connected(hallway2, meetingRoom3, doorMeetingRoom3).
connected(hallway2,      kitchen, doorKitchen).

%  |----| |----|    |--------------+--------------|
%  |[R1]| | o1 |    |          mR1 |          mR2 |
% ---d1-+-+-d2---||-+-----dm1------+-----dm2------|
%                ||                               |
%                hD        h2                     |
%                ||                               |
% ---d3-+-+-d4---||--+-----dk------+-----dm3------|
%  | o3 | | o4 |     |           k |          mR3 |
%  |----| |----|     |-------------+--------------|
start( agentAt(office1)
     ).

%  |----| |----|    |--------------+--------------|
%  | o1 | | o2 |    | meetingRoom1 | meetingRoom2 |
% ---d1-+-+-d2---||-+-----dm1------+-----dm2------|
%                ||                               |
%         h1     hD        h2                     |
%                ||                               |
% ---d3-+-+-d4---||--+-----dk------+-----dm3------|
%  | o3 | | o4 |     | [R1]      k |          mR3 |
%  |----| |----|     |-------------+--------------|
goal( agentAt(kitchen)
    ).
