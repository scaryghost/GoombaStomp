class GSPlayerController extends KFPCServ;

function SetPawnClass(string inClass, string inCharacter) {
    PawnClass = Class'GoombaStomp.GSHumanPawn';
    inCharacter = Class'KFGameType'.Static.GetValidCharacter(inCharacter);
    PawnSetupRecord = class'xUtil'.static.FindPlayerRecord(inCharacter);
    PlayerReplicationInfo.SetCharacterName(inCharacter);
}

