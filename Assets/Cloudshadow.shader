Shader "CustomRenderTexture/New Custom Render Texture"
{
    Properties
    {
        _Speed ("Color", Vector) = (0.1,0,0.1,0)
        _MainTex("InputTex", 2D) = "white" {}
        _MainTex2("InputTex", 2D) = "white" {}
     }

     SubShader
     {
        Blend One Zero
        Lighting Off

        Pass
        {
            Name "New Custom Render Texture"

            CGPROGRAM
            #include "UnityCustomRenderTexture.cginc"
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
            #pragma target 3.0

            float4      _Speed;
            sampler2D   _MainTex;
            float4      _MainTex_A;
            sampler2D   _MainTex2;
            float4      _MainTex2_A;

            float4 frag(v2f_customrendertexture IN) : COLOR
            {
                
                float4 cloud = tex2D(_MainTex, IN.localTexcoord.xy + frac(_Time * _Speed.xy));// * _Color;
                float4 cloud2 = tex2D(_MainTex2, IN.localTexcoord.xy + frac(_Time * _Speed.zw)); // * _Color;
                // TODO: Replace this by actual code!
                return max(0.1f, cloud * cloud2);

            }
            ENDCG
        }
    }
}
