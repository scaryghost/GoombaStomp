class SRVetMario extends SRVeterancyTypes
    abstract;

var array<int> progressArray;

static function AddCustomStats( ClientPerkRepLink Other) {
    Other.AddCustomValue(class'StompProgressInt');
}

static function int GetPerkProgressInt( ClientPerkRepLink StatOther, 
        out int FinalInt, byte CurLevel, byte ReqNum ) {
    if (CurLevel < 7) {
        FinalInt= default.progressArray[curLevel];
    } else {
        FinalInt = default.progressArray[6]+GetDoubleScaling(CurLevel,500000);
    }
    return Min(StatOther.GetCustomValueInt(Class'StompProgressInt'),FinalInt);
}

static function float AddExtraAmmoFor(KFPlayerReplicationInfo KFPRI, Class<Ammunition> AmmoType) {
    if ( AmmoType == class'FragAmmo' ) {
        return 1.0 + (0.20 * float(KFPRI.ClientVeteranSkillLevel));
    }
    return 1.0;
}

static function int AddDamage(KFPlayerReplicationInfo KFPRI, KFMonster Injured, 
        KFPawn DamageTaker, int InDamage, class<DamageType> DmgType) {
    if( DmgType == class'DamTypeStomp' ) {
        if ( KFPRI.ClientVeteranSkillLevel == 0 )
            return float(InDamage) * 1.10;
        // Up to 100% increase in Stomp Damage
        return float(InDamage) * (1.0 + (0.20 * float(Min(KFPRI.ClientVeteranSkillLevel, 6))));
    }
    return InDamage;
}

static function bool CanBeGrabbed(KFPlayerReplicationInfo KFPRI, KFMonster Other) {
    return !Other.IsA('ZombieClot');
}

static function class<Grenade> GetNadeType(KFPlayerReplicationInfo KFPRI) {
    return class'FireballNade';
}

defaultproperties {
    progressArray(0)=5000
    progressArray(1)=25000
    progressArray(2)=100000
    progressArray(3)=500000
    progressArray(4)=1500000
    progressArray(5)=3500000
    progressArray(6)=5500000

    VeterancyName="Mario"
    OnHUDIcon=Texture'GoombaStompTex.Perks.Perk_Mario'
    OnHUDGoldIcon=Texture'GoombaStompTex.Perks.Perk_Mario_Gold'
    Requirements(0)="Deal %x stomp damage"

    SRLevelEffects(0)="10% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire"
    SRLevelEffects(1)="20% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|20% increase is frag capacity"
    SRLevelEffects(2)="40% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|40% increase is frag capacity"
    SRLevelEffects(3)="60% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|60% increase is frag capacity"
    SRLevelEffects(4)="80% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|80% increase is frag capacity"
    SRLevelEffects(5)="100% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|100% increase is frag capacity"
    SRLevelEffects(6)="120% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|120% increase is frag capacity"

    CustomLevelInfo="120% more stomp damage|Cannot by grabbed by clots|Grenades set enemies on fire|120% increase is frag capacity"
}
