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

void EfxPlaySEwithCmdCtrl(struct Anim * anim, int cmd)
{
    u16 sound_type, val2;
    int sound_pos;
    int pos, terrain, volume, basecon, tmp, _tmp;
    int songid;
    s16 _songid, _volume;
    s16 * song_table;

    struct Anim * anim2 = GetAnimAnotherSide(anim);

    if (GetAISLayerId(anim) == 1)
        return;

    pos = GetAnimPosition(anim);
    if (pos == POS_L)
        terrain = gBanimTerrain[POS_L];
    else
        terrain = gBanimTerrain[POS_R];

    sound_type = GetEfxSoundType1FromTerrain(terrain);
    if (terrain == TERRAIN_BRIDGE_14)
    {
        if (IsAnimSoundInPositionMaybe(anim) == 0)
            sound_type = 2;
    }

    if (pos == POS_L)
        basecon = gBanimCon[POS_L];
    else
        basecon = gBanimCon[POS_R];

    val2 = GetEfxSoundType2FromBaseCon(basecon);

    songid = -1;
    sound_pos = (s16)(GetProperAnimSoundLocation(anim) + anim->xPosition);
    volume = 0x100;

    switch (cmd) {
    case 25:
        songid = SONG_D1;
        break;

    case 27:
        song_table = (s16 *)gBanimSongTable1[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 28:
        song_table = (s16 *)gBanimSongTable2[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 29:
        song_table = (s16 *)gBanimSongTable3[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 30:
        song_table = (s16 *)gBanimSongTable4[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 31:
        EfxPlayCriticalHittedSFX(anim2);

        if (GetEfxHpChangeType(anim2) != EFX_HPT_NOT_CHANGE)
        {
            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE)
            {
                _songid = SONG_3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = SONG_D2;
            break;

        case EFX_HPT_DEFEATED:
            songid = SONG_D5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = SONG_2CE;
            break;

        default:
            break;
        }
        sound_pos = (s16)(anim2->xPosition + GetProperAnimSoundLocation(anim2));
        break;

    case 32:
        EfxPlayCriticalHittedSFX(anim2);
        if (GetEfxHpChangeType(anim2) != EFX_HPT_NOT_CHANGE)
        {
            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE)
            {
                _songid = SONG_3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = SONG_D3;
            break;

        case EFX_HPT_DEFEATED:
            songid = SONG_D5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = SONG_2CE;
            break;

        default:
            break;
        }
        sound_pos = (s16)(anim2->xPosition + GetProperAnimSoundLocation(anim2));
        break;

    case 33:
        EfxPlayCriticalHittedSFX(anim2);

        if (GetEfxHpChangeType(anim2) != EFX_HPT_NOT_CHANGE)
        {
            if (GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE)
            {
                _songid = SONG_3CF;
                EfxPlaySE(_songid, 0x100);
                M4aPlayWithPostionCtrl(_songid, anim->xPosition, 1);
            }
        }

        switch (GetEfxHpChangeType(anim2)) {
        case EFX_HPT_CHANGED:
            songid = SONG_D4;
            break;

        case EFX_HPT_DEFEATED:
            songid = SONG_D5;
            break;

        case EFX_HPT_NOT_CHANGE:
            songid = SONG_2CE;
            break;

        default:
            break;
        }
        sound_pos = (s16)(anim2->xPosition + GetProperAnimSoundLocation(anim2));
        break;

    case 34:
        songid = SONG_C9;
        break;

    case 35:
        songid = SONG_C8;
        break;

    case 36:
        songid = SONG_CA;
        break;

    case 37:
        songid = SONG_263;
        if (pos == POS_L)
            songid = songid - 1; //SONG_262
        break;

    case 40:
        songid = SONG_F6;
        break;

    case 41:
        songid = SONG_141;
        break;

    case 42:
        songid = SONG_142;
        break;

    case 43:
        songid = SONG_267;
        if (pos == POS_L)
            songid = songid - 1; //SONG_266
        break;

    case 47:
        songid = SONG_2F8;
        break;

    case 51:
        songid = SONG_E7;
        break;

    case 52:
        if (pos != POS_L)
            tmp = gBanimIdx[POS_L];
        else
            tmp = gBanimIdx[POS_R];

        switch (tmp) {
        case 0xBC:  /* todo: battle anim index */
        case 0xBD:
        case 0xBE:
        case 0xBF:
            song_table = (s16 *)gBanimSongTable1[sound_type];
            _tmp = pos + 4;
            songid = song_table[_tmp];
            break;

        default:
            song_table = (s16 *)gBanimSongTable1[sound_type];
            songid = song_table[pos + val2 * 2];
            break;
        }
        break;

    case 53:
        songid = SONG_265;
        if (pos == POS_L)
            songid = songid - 1; // SONG_264
        break;

    case 54:
        songid = SONG_CE;
        break;

    case 55:
        songid = SONG_CF;
        break;

    case 56:
        songid = SONG_CB;
        break;

    case 58:
        songid = SONG_2D3;
        break;

    case 59:
        songid = SONG_2D4;
        break;

    case 60:
        songid = SONG_263;
        if (pos == POS_L)
            songid = songid - 1; //SONG_262

        volume = 0x80;
        break;

    case 62:
        songid = SONG_F1;
        break;

    case 63:
        songid = SONG_136;
        break;

    case 64:
        songid = SONG_117;
        break;

    case 65:
        songid = SONG_EB;
        break;

    case 66:
        songid = SONG_EA;
        break;

    case 67:
        songid = SONG_2CF;
        break;

    case 68:
        songid = SONG_2D0;
        break;

    case 69:
        songid = SONG_2D1;
        break;

    case 70:
        songid = SONG_2D2;
        break;

    case 72:
        songid = SONG_ED;
        break;

    case 73:
        songid = SONG_135;
        break;

    case 74:
        songid = SONG_134;
        break;

    case 75:
        songid = SONG_2DD;
        break;

    case 76:
        songid = SONG_2DE;
        break;

    case 77:
        songid = SONG_2DF;
        break;

    case 79:
        songid = SONG_2F7;
        break;

    case 80:
        songid = SONG_2E8;
        break;

    case 86:
        songid = SONG_325;
        break;

    case 87:
        songid = SONG_326;
        break;

    case 88:
        songid = SONG_327;
        break;

    case 89:
        song_table = (s16 *)gBanimSongTable5[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 90:
        songid = SONG_32A;
        break;

    case 91:
        songid = SONG_32B;
        break;

    case 92:
        songid = SONG_32C;
        break;

    case 93:
        song_table = (s16 *)gBanimSongTable6[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 94:
        songid = SONG_32E;
        break;

    case 95:
        songid = SONG_332;
        break;

    case 96:
        songid = SONG_3B7;
        break;

    case 97:
        songid = SONG_32F;
        break;

    case 98:
        songid = SONG_330;
        break;

    case 99:
        songid = SONG_331;
        break;

    case 100:
        songid = SONG_320;
        break;

    case 101:
        songid = SONG_321;
        break;

    case 102:
        song_table = (s16 *)gBanimSongTable7[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 103:
        song_table = (s16 *)gBanimSongTable8[sound_type];
        songid = song_table[pos + val2 * 2];
        break;

    case 104:
        songid = SONG_3C0;
        break;

    case 106:
        songid = SONG_3C2;
        break;

    case 107:
        songid = SONG_3C3;
        break;

    case 108:
        songid = SONG_3C4;
        break;

    case 109:
        song_table = (s16 *)gBanimSongTable1[sound_type];
        songid = song_table[pos];
        break;

    case 110:
        song_table = (s16 *)gBanimSongTable1[sound_type];
        songid = song_table[pos + 2];
        break;

    case 111:
        song_table = (s16 *)gBanimSongTable1[sound_type];
        songid = song_table[pos + 4];
        break;

    case 112:
        song_table = (s16 *)gBanimSongTable1[sound_type];
        songid = song_table[pos + 6];
        break;

    case 115:
        songid = SONG_322;
        break;

    case 116:
        songid = SONG_37D;
        break;

    case 117:
        songid = SONG_329;
        break;

    case 118:
        songid = SONG_37A;
        break;

    case 119:
        songid = SONG_37B;
        break;

    case 120:
        songid = SONG_2E4;
        break;

    case 121:
        songid = SONG_37C;
        break;

    case 122:
        songid = SONG_37F;
        break;

    case 123:
        songid = SONG_DE;
        break;

    default:
        songid = SONG_NONE;
        break;
    }

    if (songid != -1)
    {
        EfxPlaySE(songid, volume);
        M4aPlayWithPostionCtrl(songid, sound_pos, 1);
    }
}
