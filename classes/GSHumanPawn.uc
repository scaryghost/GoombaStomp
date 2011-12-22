class GSHumanPawn extends KFHumanPawn;

singular event BaseChange() {
    local float decorMass;

    if ( bInterpolating )
        return;
    if ( (base == None) && (Physics == PHYS_None) )
        SetPhysics(PHYS_Falling);
    // Pawns can only set base to non-pawns, or pawns which specifically allow it.
    // Otherwise we do some damage and jump off.
    else if ( Pawn(Base) != None && Base != DrivenVehicle ) {
        if ( !Pawn(Base).bCanBeBaseForPawns ) {
            Base.TakeDamage( (1-Velocity.Z/400)* Mass/Base.Mass, Self ,
                    Location,0.5 * Velocity , class'DamTypeStomp');
            JumpOffPawn();
        }
    }
    else if ( (Decoration(Base) != None) && (Velocity.Z < -400) ) {
        decorMass = FMax(Decoration(Base).Mass, 1);
        Base.TakeDamage((-2* Mass/decorMass * Velocity.Z/400), Self, 
                Location, 0.5 * Velocity, class'DamTypeStomp');
    }
}

defaultproperties {
    bCanDoubleJump= true
    MultiJumpRemaining=1
    MaxMultiJump= 1
}
