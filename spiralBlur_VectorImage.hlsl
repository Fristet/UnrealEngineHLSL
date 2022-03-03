float4 CurColor=0;
float2 NewUV = UV;
int i=0;
float2 StepSize = Distance / (int) DistanceSteps;
float2 CurDistance=0;
float2 CurOffset=0;
float SubOffset = 0;
float TwoPi = 6.283185;
float accumdist=0;

if (DistanceSteps < 1)

{
return Texture2DSample(Tex,TexSampler,UV);		
}
else
{
while ( i < (int) DistanceSteps)
{
	CurDistance += StepSize;
	for (int j = 0; j < (int) RadialSteps; j++)
	{
SubOffset +=1;
CurOffset.x = cos(TwoPi*(SubOffset / RadialSteps));
CurOffset.y = sin(TwoPi*(SubOffset / RadialSteps));
		NewUV.x = UV.x + CurOffset.x * CurDistance.x;
		NewUV.y = UV.y + CurOffset.y * CurDistance.y;
		float distpow = pow(CurDistance, KernelPower);
		CurColor += Texture2DSample(Tex,TexSampler,saturate(NewUV))*distpow;		
		accumdist += distpow;
	}
SubOffset +=RadialOffset;
i++;
}
CurColor = CurColor;
CurColor /=accumdist;
return CurColor;
}