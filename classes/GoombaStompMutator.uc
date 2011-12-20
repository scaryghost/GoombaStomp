class GoombaStompMutator extends Mutator;

function PostBeginPlay() {
    local KFGameType KF;

    KF = KFGameType(Level.Game);
    if (Level.NetMode != NM_Standalone)
        AddToPackageMap("GoombaStomp");

    if (KF == none) {
        Destroy();
        return;
    }

    KF.PlayerControllerClass= class'GoombaStomp.GSPlayerController';
    KF.PlayerControllerClassName= "GoombaStomp.GSPlayerController";

}

defaultproperties {
    GroupName="KFGoombaStomp"
    FriendlyName="Goomba Stomp"
    Description="Jump on your foes!  Version 1.0.0"
}
