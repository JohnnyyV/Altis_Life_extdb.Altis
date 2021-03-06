#include <macro.h>
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint "Tu dois sélectionner un item."};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "Tu n'as pas assez de places."};
	};
};

if(_bad != "") exitWith {hint _bad};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	life_liquide = life_liquide + _price;
	[_item,false] call life_fnc_handleItem;
	hint parseText format["Tu as vendu %1 pour <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
	[[format["%1 a vendu un %2 pour %3",name player,_itemInfo select 1,[_price] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
}
	else
{

	if(!isNil {grpPlayer getVariable "gang_bank"} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format["La banque du gang a assez pour payer cet objet, veux tu utiliser l'argent du gang ou le tiens ??<br/><br/>Argent du gang: <t color='#8cff9b'>$%1</t><br/>Ton argent: <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_liquide] call life_fnc_numberText
			],
			"Payer avec ton argent ou celui du gang",
			"Argent du Gang",
			"Mon Argent"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint parseText format["Tu as acheter %1 pour <t color='#8cff9b'>$%2</t> avec le compte du gang.",_itemInfo select 1,[_price] call life_fnc_numberText];
			[[format["%1 a acheter un %2 pour %3 avec l'argent de son gang",name player,_itemInfo select 1,[_price] call life_fnc_numberText]],"TON_fnc_writeLog",false,false] spawn life_fnc_MP;
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - _price;
			grpPlayer setVariable["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if(_price > life_liquide) exitWith {hint "Tu n'as pas assez d'argent!"};
			hint parseText format["Tu as acheté %1 pour <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call life_fnc_numberText];

			__SUB__(life_liquide,_price);
			[_item,true] spawn life_fnc_handleItem;
		};
	} else {
		if(_price > life_liquide) exitWith {hint "Tu n'as pas assez d'argent !"};
		hint parseText format["Tu as acheté %1 pour <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call life_fnc_numberText];

		life_liquide = life_liquide - _price;
		[_item,true] spawn life_fnc_handleItem;
	};
};

//Hotfix in for cop gear
if(playerSide == west) then
{
	[] call life_fnc_saveGear;
};
