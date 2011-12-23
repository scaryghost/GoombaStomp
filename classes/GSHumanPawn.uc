class GSHumanPawn extends KFHumanPawn;

var int stompCombo;
var bool hitPawn;

singular event BaseChange() {
    local float decorMass;
    local float stompDamage;

    if ( bInterpolating )
        return;
    if ( (base == None) && (Physics == PHYS_None) )
        SetPhysics(PHYS_Falling);
    // Pawns can only set base to non-pawns, or pawns which specifically allow it.
    // Otherwise we do some damage and jump off.
    else if ( Pawn(Base) != None && Base != DrivenVehicle ) {
        if ( !Pawn(Base).bCanBeBaseForPawns ) {
            stompCombo++;
            stompDamage= min(stompCombo,8)*(-Velocity.Z/10*Mass/Base.Mass);
            Base.TakeDamage( stompDamage , Self ,
                    Location,0.5 * Velocity , class'DamTypeStomp');
            JumpOffPawn();
            hitPawn= true;
        }
    }
    else if ( (Decoration(Base) != None) && (Velocity.Z < -400) ) {
        decorMass = FMax(Decoration(Base).Mass, 1);
        Base.TakeDamage((-2* Mass/decorMass * Velocity.Z/400), Self, 
                Location, 0.5 * Velocity, class'DamTypeStomp');
    }
}

event Landed(vector HitNormal) {
    super.Landed(HitNormal);
    if (!hitPawn) {
        stompCombo= 0;
    }
    hitPawn= false;
}

defaultproperties {
    bCanDoubleJump= true
    MultiJumpRemaining=1
    MaxMultiJump= 1

    StompCombo= 0
}
