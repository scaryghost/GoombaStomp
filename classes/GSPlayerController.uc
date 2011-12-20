class GSPlayerController extends KFPCServ;

function SetPawnClass(string inClass, string inCharacter) {
    super.SetPawnClass(inClass, inCharacter);
    PawnClass = Class'GoombaStomp.GSHumanPawn';
}

