float x, y, z;
float time = 1;
float3 result;
float3 objectPivot = (TransformLocalVectorToWorld(Parameters, float3(0,0,1)));
// objectPivot = (0,0,1) Local to World 3x3 Matrix Transform for Local Pivot

time = View.RealTime * windSpeed;
// RealTime = Update time per every frame

x = (2 * sin(1 * (objectPivot.x + objectPivot.y + objectPivot.z + time))) + 1;
y = (1 * sin(2 * (objectPivot.x + objectPivot.y + objectPivot.z + time))) + 0.5;
z = 0;

result = float3(x, y, z) * windStrength;

return result;