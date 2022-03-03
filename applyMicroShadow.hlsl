float aperture = 2.0 * ao * ao;
float microShadow = saturate(abs(dot(lightDirWS, normalWS)) + aperture - 1.0);
return shadow * microShadow;