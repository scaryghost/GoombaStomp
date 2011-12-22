class DamTypeStomp extends KFWeaponDamageType
    abstract;

static function AwardDamage(KFSteamStatsAndAchievements KFStatsAndAchievements, int Amount) {
	if( SRStatsBase(KFStatsAndAchievements)!=None && SRStatsBase(KFStatsAndAchievements).Rep!=None )
		SRStatsBase(KFStatsAndAchievements).Rep.ProgressCustomValue(Class'StompProgressInt',Amount);
}
    

defaultproperties {
    DeathString="%o was stomped by %k."
    FemaleSuicide="%o was stomped."
    MaleSuicide="%o was stomped."
    bArmorStops=False
    bAlwaysGibs=True
    bLocationalHit=False
    GibPerterbation=1.000000
    bCheckForHeadShots=False
}
