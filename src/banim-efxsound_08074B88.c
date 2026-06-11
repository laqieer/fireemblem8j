#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "eventinfo.h"
#include "m4a.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "constants/songs.h"

void EkrPlayMainBGM(void)
{
    int ret, songid, songid2, pid, staff_type;
    struct BattleUnit * bu, * bul, * bur, ** pbul, ** pbur;

    pbul = &gpEkrBattleUnitLeft;
    pbur = &gpEkrBattleUnitRight;

    bul = *pbul;
    bur = *pbur;

    if (gBmSt.gameStateBits & BM_FLAG_5)
    {
        gEkrMainBgmPlaying = 0;
        return;
    }

    gEkrMainBgmPlaying = 1;

    songid = gBanimFactionPal[gEkrInitialHitSide] != 1 ? SONG_ATTACK : SONG_DEFENSE;

    if (GetBattleAnimArenaFlag() == 1)
    {
        Sound_SetDefaultMaxNumChannels();
        EfxOverrideBgm(SONG_IN_THE_COLOSSEUM, 0x100);
        return;
    }

    if (GetBanimLinkArenaFlag() == 1)
    {
        EfxOverrideBgm(SONG_IN_THE_COLOSSEUM, 0x100);
        return;
    }

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        EfxOverrideBgm(SONG_TO_A_HIGHER_PLACE, 0x100);
        return;
    }

    ret = false;
    if (EkrCheckWeaponSieglindeSiegmund(bur->weaponBefore) == true)
        ret = true;

    if (!EkrCheckAttackRound(1))
        ret = false;

    if (gBanimValid[POS_L] == false)
        ret = false;

    pid = UNIT_CHAR_ID(&bul->unit);
    if (pid == CHARACTER_LYON)
        ret = false;

    if (pid == CHARACTER_LYON_FINAL)
        ret = false;

    if (pid == CHARACTER_FOMORTIIS)
        ret = false;

    if (ret == true)
    {
        EfxOverrideBgm(SONG_SACRED_STRENGTH, 0x100);
        return;
    }

    if (pid == CHARACTER_FOMORTIIS)
    {
        if (CheckFlag82() == true)
        {
            EfxOverrideBgm(SONG_55, 0x100);
            return;
        }
        SetFlag82();
    }

    songid2 = GetBanimBossBGM(&bul->unit);

    if (UNIT_FACTION(GetUnitFromCharId(UNIT_CHAR_ID(&bul->unit))) == FACTION_BLUE)
        songid2 = -1;

    if (gBanimValid[POS_L] == false)
        songid2 = -1;

    if (songid2 != -1)
    {
        EfxOverrideBgm(songid2, 0x100);
        return;
    }

    ret = false;
    if (UNIT_CLASS_ID(&bur->unit) == CLASS_DANCER)
    {
        if (gBattleStats.config & 0x40)
            ret = true;

        if (gBattleStats.config & 0x200)
            ret = true;
    }

    if (ret == true)
    {
        EfxOverrideBgm(SONG_TETHYS, 0x100);
        return;
    }

    if (EfxCheckRetaliation(POS_L) == true)
        staff_type = EfxCheckStaffType(gBattleActor.weaponBefore);
    else if (EfxCheckRetaliation(POS_R) == true)
        staff_type = EfxCheckStaffType(gBattleTarget.weaponBefore);
    else
        staff_type = 0;


    switch (staff_type) {
    case 2:
        songid = SONG_CURING;
        break;

    case 1:
        songid = SONG_HEALING;
        break;

    default:
        break;
    }

    if (songid != -1)
    {
        EfxOverrideBgm(songid, 0x100);
        return;
    }
    gEkrMainBgmPlaying = false;
}

void EkrRestoreBGM(void)
{
    if (CheckBanimHensei() == true || gBmSt.gameStateBits & BM_FLAG_5 || gEkrMainBgmPlaying == false)
    {
        MakeBgmOverridePersist();
        return;
    }

    RestoreBgm();
}

int GetBanimBossBGM(struct Unit * unit)
{
    int i, pid = UNIT_CHAR_ID(unit);
    for (i = 0; gBanimBossBGMs[i] != -1; i = i + 2)
    {
        if (pid == gBanimBossBGMs[i])
            break;
    }
    return gBanimBossBGMs[i + 1];
}
