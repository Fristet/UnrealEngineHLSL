float3 CurColor;
float3 TexColor = Tex.SampleLevel(TexSampler, saturate(UV), 0);
float3 chromaticSample;
float TexAlphaSample;
float TexAlpha = Tex.SampleLevel(TexSampler, saturate(UV), 0).a;

int i;
Steps = max(Steps, 1);
float StepSize = Distance / (int) Steps;
float2 chromaticUV = UV - Vector*0.5*Distance;
while ( i < (int) Steps)
{
    float3 chromaticSample = Tex.SampleLevel(TexSampler, saturate(chromaticUV.xy), 0);
    float3 CurrentAbberationValue=saturate(1.0-abs(3*(i/Steps)-float3(0.0,1.0,2.0))); 
    CurColor += chromaticSample*CurrentAbberationValue;

    float chromaticAlphaSample = Tex.SampleLevel(TexSampler, saturate(chromaticUV.xy), 0).a;
    // float CurrentAlphaAbberationValue=saturate(1.0-abs(3*(i/Steps))); 
    TexAlphaSample += (chromaticAlphaSample * (i/Steps));

    if ( 2 % i == 1 )
    {
    chromaticUV.x += (StepSize * (Vector.x *-1));
    chromaticUV.y += (StepSize * (Vector.y *-1));
    }

    chromaticUV.x += (StepSize * Vector.x);
    chromaticUV.y += (StepSize * Vector.y);

    i++;
}
// CurColor = CurColor - (1/Steps);
CurColor = CurColor + TexColor;
return float4( (CurColor * Brightness ) * ( saturate ( TexAlphaSample) ), TexAlphaSample );