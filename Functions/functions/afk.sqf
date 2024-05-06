///////////////////////////////////////////////////////////////////////////////////////////////////
//AFK function

//TODO
//Cut FADE - Text "AFK"
///////////////////////////////////////////////////////////////////////////////////////////////////

if (player getVariable ["afk", false]) then {
	//Damage for you!
	player setPosASL [getPosASL player select 0, getPosASL player select 1, (getPosASL player select 2) +50];//Move them back
	_plrLoc = getPos player;
	_AFKMarker = nearestObjects [_plrLoc, ["UserTexture1M_F"], 2];
	{deleteVehicle _x}forEach _AFKMarker;
	player enableSimulationGlobal true;
	player hideObjectGlobal false;
	//sleep 1;
	//player setcaptive false;
	//player allowDamage true;
	//player setVariable ["ace_medical_allowDamage", true];//ACE
	_user = profilename;
	_announce = _user + " is back from AFK";
	_announce remoteExec ["systemchat", 0, false];
	player setVariable ["afk", false, 0];
	cutText [" ", "BLACK IN", 1];
} else {
	//No Damage for you!
	cutText ["AFK", "BLACK OUT", 0.001];
	player setVariable ["afk", true, 0];
	//player allowDamage false;
	//player setVariable ["ace_medical_allowDamage", false];//ACE
	//player setcaptive true;
	_relPos = [0,1,1];
	_worldPos = player modelToWorld _relPos;
	_plrDir = getDir player;
	_AFKDir = (_plrDir + 180);
	_AFKIMAGE = createVehicle ["UserTexture1M_F", _worldPos, [], 0, "NONE"];
	_AFKIMAGE setObjectTextureGlobal [0,"#(rgb,512,512,3)text(0,0,""Caveat"",0.8,""#0000ff7f"",""#ff0000"",""AFK"")"];
	_AFKIMAGE setDir _AFKDir;
	_AFKIMAGE setpos _worldPos;
	_AFKIMAGE allowDamage false;
	_user = profilename;
	_announce = _user + " is AFK";
	_announce remoteExec ["systemchat", 0, false];
	player enableSimulationGlobal false;
	player hideObjectGlobal true;
	player setPosASL [getPosASL player select 0, getPosASL player select 1, (getPosASL player select 2) -50];//Move away
};
