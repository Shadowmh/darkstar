-----------------------------------
--  Area: West Ronfaure (100)
--    NM: Fungus_Beetle
-----------------------------------

require("/scripts/globals/fieldsofvalor");	

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
    checkRegime(killer,mob,3,1);
    checkRegime(killer,mob,4,2);
    
    -- Set Fungus Beetle's Window Open Time, and disable respawn
    wait = math.random((900),(10800));
    SetServerVariable("[POP]Fungus_Beetle", os.time(t) + wait); -- 15 minutes - 3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Fungus_Beetle");
    SetServerVariable("[PH]Fungus_Beetle", 0);
    DeterMob(PH, false);
    SpawnMob(PH, '', GetMobRespawnTime(PH));
end;

