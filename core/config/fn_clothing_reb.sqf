/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_G_Story_Protagonist_F",nil,7500],
			["U_I_G_resistanceLeader_F",nil,11500],
			["U_O_CombatUniform_oucamo",nil,17500],
			["U_O_SpecopsUniform_blk",nil,17500],
			["U_O_OfficerUniform_ocamo",nil,17500],
			["U_O_PilotCoveralls",nil,15610],
			["U_IG_leader","Guerilla Leader",15340],
			["U_I_OfficerUniform",nil,17000],
			["U_BG_Guerilla1_1",nil,15500],
			["U_O_GhillieSuit",nil,50000]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_Booniehat_dgtl",nil,650],
			["H_Cap_brn_SPECOPS",nil,650],
			["H_Cap_tan_specops_US",nil,650],
			["H_Cap_khaki_specops_UK",nil,650],
			["H_Cap_blk_Raven",nil,650],
			["H_Bandanna_mcamo",nil,650]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Balaclava_lowprofile",nil,10000],
			["G_Balaclava_blk",nil,10000],
			["G_Balaclava_oli",nil,10000],
			["G_Bandanna_aviator",nil,4000],
			["G_Bandanna_tan",nil,4000],
			["G_Bandanna_beast",nil,4000],
			["G_Bandanna_khk",nil,4000],
			["G_Bandanna_blk",nil,4000],
			["G_Bandanna_oli",nil,4000],
			["G_Bandanna_sport",nil,4000]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_FieldPack_ocamo","20 places",1000],

			["B_AssaultPack_blk","30 places",2000],
			["B_AssaultPack_cbr","30 places",2000],
			["B_AssaultPack_khk","30 places",2000],
			["B_AssaultPack_sgg","30 places",2000],
			["B_AssaultPack_rgr","30 places",2000],

			["B_FieldPack_cbr","40 places",4000],
			["B_FieldPack_blk","40 places",4000],
			["B_Kitbag_mcamo","40 places",4000],

			["B_Kitbag_sgg","55 places",7000],
			["B_Kitbag_cbr","55 places",7000],
			["B_Bergen_sgg","55 places",7000],

			["B_Carryall_oucamo","70 places",10000]
		];
	};
};