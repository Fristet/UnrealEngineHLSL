float lightWrapDistance = 0.1;
float3 wrapLight = lightWrapDistance * lightWrapColor;
float NdotL = dot (normalWS, lightDirWS);
NdotL = lerp(max(wrapLight.r, max(wrapLight.g, wrapLight.b)), 1.0, NdotL);

float wrapForwardNdotL = max(NdotL, dot(vertexNormalWS, lightDirWS));
float3 wrapForward = lerp(wrapLight, float3(0, 0, 0), wrapForwardNdotL);
float3 wrapRecede = lerp(-wrapLight, float3(0, 0, 0), NdotL);
float3 wrapLighting = saturate(lerp(wrapRecede, wrapForward, lightWrapColor));

return wrapLighting;