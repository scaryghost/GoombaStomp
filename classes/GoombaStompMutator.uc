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
    Description="All of Scary Ghost's dosh mutators combined in mutator.  Version 1.0.0"
}
