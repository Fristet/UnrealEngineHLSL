float3 cam = cameraVector;
float heightTex = 0;
float resultMask = 0;
float heightValue = 0;
float Distance = 0.1;
float fadeDist =  1/NumSteps;

int i = 0;
while (i < NumSteps)
{
    float2 bump = cam.xy * (heightValue - referencePlane);
    float2 calcUV = bump * heightRaito + UV.xy;

    heightValue -=Distance;

    heightTex = Tex.SampleLevel(TexSampler, calcUV.xy, 0);

    float heightMask = heightTex.x;

    float fadeDistE = i*fadeDist;

	if (heightMask < 0.0)
	  break;
    
    resultMask +=heightMask;
    i++;
}

return resultMask*0.01;