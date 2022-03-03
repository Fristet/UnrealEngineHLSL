float3 result, smallMotion;
float time = 1;

time = View.RealTime * windSpeed;
smallMotion = (0.065 * sin(2.65 * (normalWS.x + normalWS.y + normalWS.z + time))) * (normalWS*(1, 1, 0.35));

return smallMotion * windStrength;