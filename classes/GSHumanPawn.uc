class GSHumanPawn extends KFHumanPawn;

#exec OBJ LOAD FILE=GoombaStompSnd.uax

var int stompCombo;
var bool hitPawn;
var Sound eightComboSound;

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
            if (stompCombo > 7) {
                PlaySound(eightComboSound, SLOT_None, 2.0, true, 500.0);
            }
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

    eightComboSound=Sound 'GoombaStompSnd.StompFX.Coin'
}
