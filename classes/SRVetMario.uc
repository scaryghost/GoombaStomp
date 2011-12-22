class SRVetMario extends SRVeterancyTypes
    abstract;

static function AddCustomStats( ClientPerkRepLink Other) {
    Other.AddCustomValue(class'StompProgressInt');
    class'DualiesFire'.default.DamageType= class'DamTypeStomp';
}

static function int GetPerkProgressInt( ClientPerkRepLink StatOther, out int FinalInt, byte CurLevel, byte ReqNum )
{
	switch( CurLevel )
	{
	case 0:
		FinalInt = 1;
		break;
	case 1:
		FinalInt = 2;
		break;
	case 2:
		FinalInt = 5;
		break;
	case 3:
		FinalInt = 10;
		break;
	case 4:
		FinalInt = 15;
		break;
	case 5:
		FinalInt = 25;
		break;
	case 6:
		FinalInt = 50;
		break;
	default:
		FinalInt = 50+GetDoubleScaling(CurLevel,35);
	}
	return Min(StatOther.GetCustomValueInt(Class'StompProgressInt'),FinalInt);
}

defaultproperties
{
	Requirements(0)="Deal %x stomp damage"
}
