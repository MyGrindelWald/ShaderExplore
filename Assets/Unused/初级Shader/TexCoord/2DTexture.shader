﻿// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'




Shader"ManNiu/2DTexture"{
	
	Properties{
	_MainTex("MainTex",2D) =""{}
	_MainColor ("MianColor",color) = (1,1,1,1)
	}
	SubShader{
			Tags{"queue"="transparent"}

		Pass{

		//Blend srcalpha oneminussrcalpha
		//Zwrite off
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag 
		#include "UnityCG.cginc"

		//float tiling_x;
		//float tiling_y;
		//float offset_x;
		//float offset_y;
	
		float4 _MainColor;//Properties 
		sampler2D _MainTex;
		float4 _MainTex_ST;//固定值
	   	struct v2f{
			float4 pos:POSITION;
			float2 uv:TEXCOORD0;
		};

		v2f vert(appdata_base v){
			v2f o ; 
			
			o.pos =  UnityObjectToClipPos(v.vertex);  //UnityObjectToClipPos(v.vertex); 模型到世界 相机 投影
	
			o.uv=v.texcoord.xy*_MainTex_ST.xy+_MainTex_ST.zw;
		
			//o.uv.x *= tiling_x;
			//o.uv.y *= tiling_y;
			//o.uv.x+= offset_x;
			//o.uv.y+=offset_y;
			return o;
		}
		fixed4 frag(v2f In):COLOR{
		
			fixed4 color= tex2D(_MainTex,In.uv);
			return color;
		}
		ENDCG
	}




	}
		



}