function PolarizerMat = Polarizer(radian)
    PolarizerMat = [
    cos(radian)^2 sin(radian)*cos(radian);
    sin(radian)*cos(radian) sin(radian)^2;
];
end

