function [StationXYZ] = EarthXYZ_to_StationXYZ(StationPosB,StationPosL,EarthStationPosXYZ,EarthXYZ)
B=deg2rad(StationPosB);
L=deg2rad(StationPosL);
C=[-sin(B)*cos(L),-sin(B)*sin(L),cos(B);
    -sin(L),cos(L),0;
    cos(B)*cos(L),cos(B)*sin(L),sin(B)];
StationXYZ=C*(EarthXYZ-EarthStationPosXYZ);

end

