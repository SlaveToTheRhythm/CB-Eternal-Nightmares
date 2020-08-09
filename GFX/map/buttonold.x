xof 0303txt 0032
template XSkinMeshHeader {
 <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template SkinWeights {
 <6f0d123b-bad2-4167-a0d0-80224f25fabb>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}

template AnimTicksPerSecond {
 <9e415a43-7ba6-4a73-8743-b73d47e88476>
 DWORD AnimTicksPerSecond;
}


AnimTicksPerSecond {
 24;
}

Frame root {
 

 FrameTransformMatrix {
  1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
 }

 Mesh root {
  143;
  1.060742;1.482750;1.191722;,
  1.060742;1.482750;0.909298;,
  1.386485;1.011345;1.663128;,
  -1.051785;1.482750;1.191722;,
  -1.377526;1.011345;1.663129;,
  -1.051785;1.482750;0.909298;,
  1.289426;1.151805;0.903425;,
  1.299888;1.136664;0.903425;,
  1.386485;-0.001109;1.663128;,
  -1.377526;-0.001109;1.663129;,
  1.024257;1.482750;0.903426;,
  1.052554;1.482750;0.903426;,
  -1.280468;1.151805;0.903426;,
  -1.051785;1.482750;0.903426;,
  1.386484;-0.001109;0.903425;,
  -0.961285;-0.001109;0.903426;,
  -1.377527;-0.001109;0.903427;,
  -1.049769;1.482750;0.903426;,
  -1.043661;1.482750;0.903426;,
  -1.015440;1.482750;0.903426;,
  1.058701;1.482750;0.903426;,
  1.060742;1.482750;0.903426;,
  -1.290931;1.136664;0.903426;,
  -1.323416;1.089653;0.903426;,
  1.386484;0.858876;0.903426;,
  1.386484;1.011345;0.903426;,
  -1.377527;0.151360;0.903426;,
  1.332373;1.089653;0.903426;,
  -1.377527;1.011345;0.903426;,
  0.466519;1.686103;0.487803;,
  0.007556;1.686103;0.668769;,
  0.007556;1.686103;0.008785;,
  0.639907;1.686103;0.008785;,
  0.546976;1.482750;0.542908;,
  0.007556;1.482750;0.744692;,
  -0.451407;1.686103;-0.470234;,
  -0.624796;1.686103;0.008785;,
  -0.735650;1.482750;0.008785;,
  -0.531865;1.482750;-0.525338;,
  0.007556;1.482750;-0.727122;,
  0.007556;1.686103;-0.651200;,
  -1.050742;1.482750;-1.179870;,
  -1.050742;1.482750;-0.897446;,
  -1.376485;1.011345;-1.651276;,
  1.061785;1.482750;-1.179870;,
  0.466519;1.686103;-0.470234;,
  0.546976;1.482750;-0.525338;,
  0.750761;1.482750;0.008785;,
  1.387527;1.011345;-1.651276;,
  1.061785;1.482750;-0.897446;,
  -1.050742;1.482750;0.898392;,
  -1.050742;1.482750;0.904888;,
  -1.376485;-0.001109;-1.651276;,
  1.387527;-0.001109;-1.651276;,
  1.061785;1.482750;0.898392;,
  1.061785;1.482750;0.904887;,
  -1.006197;1.482750;0.904888;,
  1.096158;1.433006;0.904887;,
  -0.531865;1.482750;0.542908;,
  -1.376484;-0.001109;0.904888;,
  -0.012997;-0.001109;0.904888;,
  1.387527;-0.001109;0.904887;,
  -0.451407;1.686103;0.487803;,
  1.205461;1.274827;0.904887;,
  -1.376484;0.498335;0.904887;,
  -1.376484;1.011345;0.904887;,
  1.387527;0.511901;0.904887;,
  -1.194417;1.274827;0.904888;,
  -1.085115;1.433006;0.904888;,
  1.387527;1.011345;0.904887;,
  1.060742;1.482750;0.909298;,
  -1.051785;1.482750;0.909298;,
  1.289426;1.151805;0.903425;,
  1.299888;1.136664;0.903425;,
  1.386485;-0.001109;1.663128;,
  1.386485;-0.001109;1.663128;,
  -1.377526;-0.001109;1.663129;,
  -1.377526;-0.001109;1.663129;,
  1.024257;1.482750;0.903426;,
  1.052554;1.482750;0.903426;,
  -1.280468;1.151805;0.903426;,
  -1.051785;1.482750;0.903426;,
  -1.051785;1.482750;0.903426;,
  1.386484;-0.001109;0.903425;,
  1.386484;-0.001109;0.903425;,
  -0.961285;-0.001109;0.903426;,
  -1.377527;-0.001109;0.903427;,
  -1.377527;-0.001109;0.903427;,
  -1.049769;1.482750;0.903426;,
  -1.043661;1.482750;0.903426;,
  -1.015440;1.482750;0.903426;,
  1.058701;1.482750;0.903426;,
  1.060742;1.482750;0.903426;,
  1.060742;1.482750;0.903426;,
  -1.290931;1.136664;0.903426;,
  -1.323416;1.089653;0.903426;,
  1.386484;0.858876;0.903426;,
  1.386484;1.011345;0.903426;,
  -1.377527;0.151360;0.903426;,
  1.332373;1.089653;0.903426;,
  -1.377527;1.011345;0.903426;,
  0.466519;1.686103;0.487803;,
  0.007556;1.686103;0.668769;,
  0.007556;1.686103;0.668769;,
  0.639907;1.686103;0.008785;,
  0.546976;1.482750;0.542908;,
  0.007556;1.482750;0.744692;,
  0.007556;1.482750;0.744692;,
  -0.451407;1.686103;-0.470234;,
  -0.624796;1.686103;0.008785;,
  -0.735650;1.482750;0.008785;,
  -0.531865;1.482750;-0.525338;,
  0.007556;1.482750;-0.727122;,
  0.007556;1.686103;-0.651200;,
  -1.050742;1.482750;-0.897446;,
  0.466519;1.686103;-0.470234;,
  0.546976;1.482750;-0.525338;,
  0.750761;1.482750;0.008785;,
  1.061785;1.482750;-0.897446;,
  -1.050742;1.482750;0.898392;,
  -1.050742;1.482750;0.904888;,
  -1.376485;-0.001109;-1.651276;,
  -1.376485;-0.001109;-1.651276;,
  1.387527;-0.001109;-1.651276;,
  1.387527;-0.001109;-1.651276;,
  1.061785;1.482750;0.898392;,
  1.061785;1.482750;0.904887;,
  -1.006197;1.482750;0.904888;,
  1.096158;1.433006;0.904887;,
  -0.531865;1.482750;0.542908;,
  -1.376484;-0.001109;0.904888;,
  -1.376484;-0.001109;0.904888;,
  -0.012997;-0.001109;0.904888;,
  1.387527;-0.001109;0.904887;,
  1.387527;-0.001109;0.904887;,
  -0.451407;1.686103;0.487803;,
  1.205461;1.274827;0.904887;,
  -1.376484;0.498335;0.904887;,
  -1.376484;1.011345;0.904887;,
  1.387527;0.511901;0.904887;,
  -1.194417;1.274827;0.904888;,
  -1.085115;1.433006;0.904888;,
  1.387527;1.011345;0.904887;;
  132;
  3;0,2,1;,
  3;2,0,3;,
  3;3,71,4;,
  3;2,73,6;,
  3;0,71,3;,
  3;0,1,71;,
  3;4,2,3;,
  3;4,75,2;,
  3;4,77,75;,
  3;70,79,78;,
  3;4,81,80;,
  3;76,84,74;,
  3;76,87,85;,
  3;5,89,88;,
  3;5,90,89;,
  3;5,78,90;,
  3;70,91,79;,
  3;70,93,91;,
  3;20,72,11;,
  3;94,95,4;,
  3;24,97,2;,
  3;26,86,9;,
  3;80,94,4;,
  3;14,2,8;,
  3;88,82,5;,
  3;97,99,2;,
  3;99,73,2;,
  3;6,1,2;,
  3;95,28,4;,
  3;28,9,4;,
  3;101,31,30;,
  3;101,32,31;,
  3;29,107,105;,
  3;29,103,107;,
  3;108,110,109;,
  3;108,111,110;,
  3;111,113,112;,
  3;111,108,113;,
  3;41,43,114;,
  3;43,41,44;,
  3;115,117,116;,
  3;115,104,117;,
  3;44,118,48;,
  3;43,120,50;,
  3;41,118,44;,
  3;41,114,118;,
  3;48,43,44;,
  3;48,122,43;,
  3;48,124,122;,
  3;50,126,54;,
  3;50,120,127;,
  3;42,38,39;,
  3;54,128,48;,
  3;119,58,37;,
  3;50,114,43;,
  3;48,118,54;,
  3;123,131,121;,
  3;123,134,132;,
  3;125,33,34;,
  3;49,46,47;,
  3;35,31,40;,
  3;35,36,31;,
  3;105,104,29;,
  3;105,117,104;,
  3;116,113,115;,
  3;116,112,113;,
  3;135,110,129;,
  3;135,109,110;,
  3;129,102,135;,
  3;129,106,102;,
  3;62,31,36;,
  3;62,30,31;,
  3;45,31,32;,
  3;45,40,31;,
  3;125,47,33;,
  3;125,49,47;,
  3;49,39,46;,
  3;49,42,39;,
  3;42,37,38;,
  3;42,119,37;,
  3;119,34,58;,
  3;119,125,34;,
  3;128,136,48;,
  3;137,138,43;,
  3;139,133,53;,
  3;130,43,52;,
  3;138,140,43;,
  3;140,141,43;,
  3;136,142,48;,
  3;142,53,48;,
  3;55,56,60;,
  3;4,71,81;,
  3;76,85,84;,
  3;5,70,78;,
  3;83,15,96;,
  3;15,16,98;,
  3;98,100,15;,
  3;100,23,15;,
  3;96,15,10;,
  3;27,25,96;,
  3;22,15,23;,
  3;22,12,15;,
  3;12,13,17;,
  3;17,18,12;,
  3;18,19,12;,
  3;15,19,10;,
  3;7,27,96;,
  3;20,92,72;,
  3;72,7,96;,
  3;12,19,15;,
  3;10,11,72;,
  3;96,10,72;,
  3;14,24,2;,
  3;6,21,1;,
  3;28,26,9;,
  3;43,141,120;,
  3;50,127,126;,
  3;54,126,128;,
  3;123,132,131;,
  3;130,137,43;,
  3;142,139,53;,
  3;59,60,64;,
  3;60,61,66;,
  3;66,69,63;,
  3;60,66,63;,
  3;65,64,67;,
  3;67,64,60;,
  3;51,68,56;,
  3;68,67,56;,
  3;60,63,57;,
  3;67,60,56;,
  3;57,55,60;;

  MeshNormals {
   143;
   0.238432;0.949292;0.204926;,
   0.610074;0.792344;0.000000;,
   0.780956;0.544070;0.306751;,
   -0.241840;0.876751;0.415717;,
   -0.753165;0.522653;0.399471;,
   0.000000;1.000000;0.000030;,
   0.866750;0.461242;0.189738;,
   -0.000019;-0.000001;-1.000000;,
   1.000000;0.000000;0.000000;,
   -1.000000;0.000000;0.000000;,
   -0.000001;-0.000001;-1.000000;,
   0.000000;0.000001;-1.000000;,
   -0.000001;0.000000;-1.000000;,
   0.000000;-0.000021;-1.000000;,
   1.000000;0.000000;0.000000;,
   -0.000001;0.000000;-1.000000;,
   -0.000002;-0.000005;-1.000000;,
   0.000000;0.000007;-1.000000;,
   0.000000;0.000000;-1.000000;,
   -0.000001;0.000000;-1.000000;,
   0.000000;0.000001;-1.000000;,
   0.897246;0.441531;0.000000;,
   0.000014;0.000003;-1.000000;,
   0.000005;0.000002;-1.000000;,
   0.988900;0.127583;0.076157;,
   0.000000;0.000000;-1.000000;,
   -0.996386;-0.078254;0.033033;,
   0.000006;0.000002;-1.000000;,
   -0.940022;0.257556;0.223658;,
   0.545848;0.398795;0.736894;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000001;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;-0.000001;,
   0.000000;1.000000;0.000000;,
   -0.238433;0.949292;-0.204926;,
   0.000000;1.000000;0.000000;,
   -0.781290;0.544777;-0.304638;,
   0.241840;0.876751;-0.415717;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;1.000000;0.000000;,
   0.753304;0.522938;-0.398834;,
   0.000000;1.000000;0.000000;,
   -0.459236;0.888314;-0.000001;,
   -0.000003;-0.000000;1.000000;,
   -1.000000;0.000000;0.000000;,
   1.000000;0.000000;0.000000;,
   0.610077;0.792342;0.000000;,
   -0.000002;-0.000000;1.000000;,
   0.000000;-0.000000;1.000000;,
   -0.000002;-0.000000;1.000000;,
   0.000000;1.000000;0.000000;,
   0.000000;0.000001;1.000000;,
   -0.000002;-0.000000;1.000000;,
   0.000001;-0.000001;1.000000;,
   0.000000;1.000000;0.000000;,
   -0.000001;0.000001;1.000000;,
   -0.000001;-0.000000;1.000000;,
   0.000000;-0.000000;1.000000;,
   0.000000;-0.000000;1.000000;,
   0.000000;-0.000000;1.000000;,
   0.000000;0.000001;1.000000;,
   0.000001;-0.000000;1.000000;,
   0.000000;1.000000;0.000006;,
   -0.464468;0.885590;0.000000;,
   -0.000001;-0.000001;-1.000000;,
   0.741032;0.667137;0.076158;,
   0.000000;-1.000000;-0.000000;,
   0.000000;-0.000000;1.000000;,
   0.000000;-1.000000;-0.000000;,
   0.000000;-0.000000;1.000000;,
   0.000000;1.000000;0.000057;,
   0.000000;1.000000;0.000000;,
   -0.851585;0.514831;0.098750;,
   -0.814000;0.562481;0.144980;,
   0.000000;1.000000;0.000000;,
   0.000000;0.000000;-1.000000;,
   0.000000;-1.000000;-0.000000;,
   0.000000;-1.000000;-0.000000;,
   -1.000000;0.000000;0.000000;,
   0.000000;-1.000000;-0.000000;,
   0.000000;1.000000;0.000031;,
   0.000000;1.000000;0.000046;,
   0.000000;1.000000;-0.000035;,
   0.000000;1.000000;0.000000;,
   0.000000;0.000001;-1.000000;,
   0.000000;1.000000;0.000000;,
   -0.716472;0.690603;0.098669;,
   -0.841726;0.526030;0.121610;,
   -0.000001;-0.000001;-1.000000;,
   0.876407;0.419531;0.236441;,
   -0.000001;0.000000;-1.000000;,
   0.715993;0.679673;0.159368;,
   0.000003;0.000001;-1.000000;,
   0.000000;1.000000;0.000000;,
   -0.335891;0.349693;0.874581;,
   0.346503;0.328103;0.878797;,
   0.878761;0.463767;0.112690;,
   0.718918;0.443246;0.535434;,
   -0.330726;0.330090;0.884116;,
   0.336382;0.346828;0.875533;,
   -0.721301;0.444624;-0.531068;,
   -0.878015;0.478633;0.000001;,
   -0.886506;0.462716;0.000000;,
   -0.541725;0.400234;-0.739152;,
   0.000000;0.349769;-0.936836;,
   -0.000001;0.371290;-0.928517;,
   -0.610076;0.792343;0.000000;,
   0.721303;0.444623;-0.531068;,
   0.541726;0.400232;-0.739153;,
   0.878574;0.465312;-0.107670;,
   0.464473;0.885587;0.000000;,
   0.000000;1.000000;0.000000;,
   -0.462772;0.882286;-0.086098;,
   0.000000;-1.000000;-0.000000;,
   0.000000;0.000000;-1.000000;,
   0.000000;-1.000000;-0.000000;,
   0.000000;0.000000;-1.000000;,
   0.000000;1.000000;0.000000;,
   0.462591;0.881929;-0.090610;,
   -0.146877;0.989155;-0.000033;,
   0.716476;0.690599;-0.098668;,
   -0.541724;0.400237;0.739152;,
   -1.000000;0.000000;0.000000;,
   0.000000;-1.000000;-0.000000;,
   0.000000;-1.000000;-0.000000;,
   1.000000;0.000000;0.000000;,
   0.000000;-1.000000;-0.000000;,
   -0.721308;0.444612;0.531070;,
   0.841725;0.526032;-0.121610;,
   -0.988900;0.127582;-0.076157;,
   -0.876406;0.419533;-0.236441;,
   0.996386;-0.078254;-0.033032;,
   -0.715993;0.679673;-0.159368;,
   -0.741032;0.667137;-0.076157;,
   0.940725;0.258453;-0.219635;;
   132;
   3;0,2,1;,
   3;2,0,3;,
   3;3,71,4;,
   3;2,73,6;,
   3;0,71,3;,
   3;0,1,71;,
   3;4,2,3;,
   3;4,75,2;,
   3;4,77,75;,
   3;70,79,78;,
   3;4,81,80;,
   3;76,84,74;,
   3;76,87,85;,
   3;5,89,88;,
   3;5,90,89;,
   3;5,78,90;,
   3;70,91,79;,
   3;70,93,91;,
   3;20,72,11;,
   3;94,95,4;,
   3;24,97,2;,
   3;26,86,9;,
   3;80,94,4;,
   3;14,2,8;,
   3;88,82,5;,
   3;97,99,2;,
   3;99,73,2;,
   3;6,1,2;,
   3;95,28,4;,
   3;28,9,4;,
   3;101,31,30;,
   3;101,32,31;,
   3;29,107,105;,
   3;29,103,107;,
   3;108,110,109;,
   3;108,111,110;,
   3;111,113,112;,
   3;111,108,113;,
   3;41,43,114;,
   3;43,41,44;,
   3;115,117,116;,
   3;115,104,117;,
   3;44,118,48;,
   3;43,120,50;,
   3;41,118,44;,
   3;41,114,118;,
   3;48,43,44;,
   3;48,122,43;,
   3;48,124,122;,
   3;50,126,54;,
   3;50,120,127;,
   3;42,38,39;,
   3;54,128,48;,
   3;119,58,37;,
   3;50,114,43;,
   3;48,118,54;,
   3;123,131,121;,
   3;123,134,132;,
   3;125,33,34;,
   3;49,46,47;,
   3;35,31,40;,
   3;35,36,31;,
   3;105,104,29;,
   3;105,117,104;,
   3;116,113,115;,
   3;116,112,113;,
   3;135,110,129;,
   3;135,109,110;,
   3;129,102,135;,
   3;129,106,102;,
   3;62,31,36;,
   3;62,30,31;,
   3;45,31,32;,
   3;45,40,31;,
   3;125,47,33;,
   3;125,49,47;,
   3;49,39,46;,
   3;49,42,39;,
   3;42,37,38;,
   3;42,119,37;,
   3;119,34,58;,
   3;119,125,34;,
   3;128,136,48;,
   3;137,138,43;,
   3;139,133,53;,
   3;130,43,52;,
   3;138,140,43;,
   3;140,141,43;,
   3;136,142,48;,
   3;142,53,48;,
   3;55,56,60;,
   3;4,71,81;,
   3;76,85,84;,
   3;5,70,78;,
   3;83,15,96;,
   3;15,16,98;,
   3;98,100,15;,
   3;100,23,15;,
   3;96,15,10;,
   3;27,25,96;,
   3;22,15,23;,
   3;22,12,15;,
   3;12,13,17;,
   3;17,18,12;,
   3;18,19,12;,
   3;15,19,10;,
   3;7,27,96;,
   3;20,92,72;,
   3;72,7,96;,
   3;12,19,15;,
   3;10,11,72;,
   3;96,10,72;,
   3;14,24,2;,
   3;6,21,1;,
   3;28,26,9;,
   3;43,141,120;,
   3;50,127,126;,
   3;54,126,128;,
   3;123,132,131;,
   3;130,137,43;,
   3;142,139,53;,
   3;59,60,64;,
   3;60,61,66;,
   3;66,69,63;,
   3;60,66,63;,
   3;65,64,67;,
   3;67,64,60;,
   3;51,68,56;,
   3;68,67,56;,
   3;60,63,57;,
   3;67,60,56;,
   3;57,55,60;;
  }

  MeshTextureCoords {
   143;
   -0.673219;-0.314699;,
   -0.673219;-0.337961;,
   -0.721469;-0.275871;,
   -0.360302;-0.314699;,
   -0.312052;-0.275871;,
   -0.070824;-0.056591;,
   -0.707092;-0.338444;,
   0.815015;0.365637;,
   -0.976820;-0.275871;,
   -0.062561;-0.275871;,
   0.801122;0.372365;,
   0.802548;0.372365;,
   0.684956;0.365931;,
   0.696483;0.372365;,
   -0.976820;-0.338444;,
   0.701044;0.343518;,
   0.680064;0.343518;,
   0.696584;0.372365;,
   0.696892;0.372365;,
   0.698314;0.372365;,
   0.802858;0.372365;,
   -0.673219;-0.338445;,
   0.684429;0.365637;,
   0.682792;0.364723;,
   -0.759923;-0.338444;,
   0.819379;0.363201;,
   -0.100133;-0.338444;,
   0.816652;0.364723;,
   -0.312052;-0.338444;,
   -0.775930;-0.882852;,
   -0.185224;-0.217276;,
   -0.185224;-0.152503;,
   -0.123163;-0.152503;,
   -0.129264;-0.208421;,
   -0.186159;-0.229703;,
   -0.230268;-0.105491;,
   -0.247285;-0.152503;,
   -0.264548;-0.152087;,
   -0.243054;-0.095753;,
   -0.186159;-0.074471;,
   -0.185224;-0.087730;,
   -0.673219;-0.314699;,
   -0.293641;-0.056591;,
   -0.721469;-0.275871;,
   -0.360302;-0.314699;,
   -0.140180;-0.105491;,
   -0.129264;-0.095753;,
   -0.107770;-0.152087;,
   -0.312052;-0.275871;,
   -0.070824;-0.056591;,
   -0.673219;-0.485875;,
   0.197039;0.372365;,
   -0.976820;-0.275871;,
   -0.062561;-0.275871;,
   -0.360302;-0.485875;,
   0.303517;0.372365;,
   0.199284;0.372365;,
   0.305250;0.371398;,
   -0.243054;-0.208421;,
   0.180621;0.343518;,
   0.249345;0.343518;,
   0.319936;0.343518;,
   -0.230268;-0.199516;,
   0.310759;0.368323;,
   0.180621;0.353228;,
   0.180621;0.363201;,
   0.319936;0.353491;,
   0.189798;0.368323;,
   0.195307;0.371398;,
   0.319936;0.363201;,
   -0.293641;-0.056591;,
   -0.360302;-0.337961;,
   0.814487;0.365931;,
   -0.708642;-0.338444;,
   -0.981910;-0.021552;,
   -0.721469;-0.019722;,
   -0.981910;-0.268234;,
   -0.312052;-0.019722;,
   -0.289935;-0.057207;,
   -0.292843;-0.057209;,
   -0.326429;-0.338444;,
   -0.360302;-0.338445;,
   -0.070824;-0.057210;,
   0.819379;0.343518;,
   -0.944761;-0.021552;,
   -0.944761;-0.231085;,
   -0.062561;-0.338444;,
   -0.944761;-0.268234;,
   -0.071063;-0.057210;,
   -0.071746;-0.057209;,
   -0.074800;-0.057207;,
   -0.293453;-0.057210;,
   0.802961;0.372365;,
   -0.293641;-0.057210;,
   -0.324879;-0.338444;,
   -0.320067;-0.338444;,
   0.819379;0.360237;,
   -0.721469;-0.338444;,
   0.680064;0.346483;,
   -0.713454;-0.338444;,
   0.680064;0.363201;,
   -0.140180;-0.199516;,
   -0.977336;-0.882852;,
   -0.748049;-0.882852;,
   -0.805371;-0.882852;,
   -0.776890;-0.862966;,
   -0.977336;-0.862966;,
   -0.748049;-0.862966;,
   -0.890573;-0.882852;,
   -0.920014;-0.882852;,
   -0.920014;-0.862966;,
   -0.891533;-0.862966;,
   -0.862692;-0.862966;,
   -0.862692;-0.882852;,
   -0.673219;-0.337961;,
   -0.834812;-0.882852;,
   -0.833851;-0.862966;,
   -0.805371;-0.862966;,
   -0.360302;-0.337961;,
   -0.293641;-0.245998;,
   -0.673219;-0.486410;,
   -0.981910;-0.021552;,
   -0.721469;-0.019722;,
   -0.981910;-0.268234;,
   -0.312052;-0.019722;,
   -0.070824;-0.245998;,
   -0.360302;-0.486410;,
   -0.666621;-0.486410;,
   -0.355211;-0.486410;,
   -0.948495;-0.862966;,
   -0.976820;-0.486410;,
   -0.856916;-0.021552;,
   -0.856916;-0.143240;,
   -0.062561;-0.486410;,
   -0.856916;-0.268234;,
   -0.949455;-0.882852;,
   -0.339020;-0.486410;,
   -0.850855;-0.486410;,
   -0.721469;-0.486410;,
   -0.188978;-0.486410;,
   -0.694501;-0.486410;,
   -0.678311;-0.486410;,
   -0.312052;-0.486410;;
  }

  VertexDuplicationIndices {
   143;
   70;
   0,
   1,
   2,
   3,
   4,
   5,
   6,
   7,
   8,
   9,
   10,
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20,
   21,
   22,
   23,
   24,
   25,
   26,
   27,
   28,
   29,
   30,
   31,
   32,
   33,
   34,
   35,
   36,
   37,
   38,
   39,
   40,
   41,
   42,
   43,
   44,
   45,
   46,
   47,
   48,
   49,
   50,
   51,
   52,
   53,
   54,
   55,
   56,
   57,
   58,
   59,
   60,
   61,
   62,
   63,
   64,
   65,
   66,
   67,
   68,
   69,
   1,
   5,
   6,
   7,
   8,
   8,
   9,
   9,
   10,
   11,
   12,
   13,
   13,
   14,
   14,
   15,
   16,
   16,
   17,
   18,
   19,
   20,
   21,
   21,
   22,
   23,
   24,
   25,
   26,
   27,
   28,
   29,
   30,
   30,
   32,
   33,
   34,
   34,
   35,
   36,
   37,
   38,
   39,
   40,
   42,
   45,
   46,
   47,
   49,
   50,
   51,
   52,
   52,
   53,
   53,
   54,
   55,
   56,
   57,
   58,
   59,
   59,
   60,
   61,
   61,
   62,
   63,
   64,
   65,
   66,
   67,
   68,
   69;
  }

  MeshMaterialList {
   1;
   132;
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0,
   0;

   Material KeyPadOld {
    0.749020;0.749020;0.749020;1.000000;;
    40.000000;
    0.000000;0.000000;0.000000;;
    0.000000;0.000000;0.000000;;

    TextureFilename {
     "C:/Users/nikna/Desktop/SCP-CB - YCEMod/GFX/map/KeyPadOld.jpg";
    }
   }
  }

  XSkinMeshHeader {
   1;
   1;
   1;
  }

  SkinWeights {
   "root";
   143;
   0,
   1,
   2,
   3,
   4,
   5,
   6,
   7,
   8,
   9,
   10,
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20,
   21,
   22,
   23,
   24,
   25,
   26,
   27,
   28,
   29,
   30,
   31,
   32,
   33,
   34,
   35,
   36,
   37,
   38,
   39,
   40,
   41,
   42,
   43,
   44,
   45,
   46,
   47,
   48,
   49,
   50,
   51,
   52,
   53,
   54,
   55,
   56,
   57,
   58,
   59,
   60,
   61,
   62,
   63,
   64,
   65,
   66,
   67,
   68,
   69,
   70,
   71,
   72,
   73,
   74,
   75,
   76,
   77,
   78,
   79,
   80,
   81,
   82,
   83,
   84,
   85,
   86,
   87,
   88,
   89,
   90,
   91,
   92,
   93,
   94,
   95,
   96,
   97,
   98,
   99,
   100,
   101,
   102,
   103,
   104,
   105,
   106,
   107,
   108,
   109,
   110,
   111,
   112,
   113,
   114,
   115,
   116,
   117,
   118,
   119,
   120,
   121,
   122,
   123,
   124,
   125,
   126,
   127,
   128,
   129,
   130,
   131,
   132,
   133,
   134,
   135,
   136,
   137,
   138,
   139,
   140,
   141,
   142;
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000,
   1.000000;
   1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,-1.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000;;
  }
 }
}