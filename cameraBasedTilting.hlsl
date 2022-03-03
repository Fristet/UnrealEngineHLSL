float tiltingDistance;
float3 calcY, calcZ, result, resultY, resultYZ;

calcY = vectorY * tiltFactor;
calcZ = 1-(dot( vectorY, float3( 0, 0, 1 )));
resultY = NormalWS.z + calcY;
resultYZ = calcZ * resultY;
tiltingDistance = 1-(saturate( (PixelDepth + tiltingDist) / tiltFalloff) );
result = resultYZ * tiltingDistance;

return result;