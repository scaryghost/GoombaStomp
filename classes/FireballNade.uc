class FireballNade extends FlameNade;

simulated function HitWall( vector HitNormal, actor Wall ) {
    Explode(Location, HitNormal);
}
