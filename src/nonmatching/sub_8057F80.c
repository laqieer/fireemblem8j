/* NON_MATCHING: byte source is asm/sub_8057F80.s @ JP 0x08057F80 (2936 bytes /
 * 0xB78; region-different, gbadisasm descriptive asm; carved_rom places those
 * bytes). This C DOCUMENTS the reconstruction and is NOT in the make-compare
 * oracle: it is compiled only by `make nonmatching` (never linked, never
 * checksummed). See docs/nonmatching.md for the two-build split.
 *
 * PROPOSED NAME : PrepareBattleGraphicsMaybe   (the asm/.s already carries this
 *                 global label; JP address 0x08057F80.)
 * CLUSTER       : EKR battle-animation intro engine.
 * FE8U ANALOG   : fireemblem8u/src/banim-ekrbattleintro.c :: PrepareBattleGraphicsMaybe
 *                 (US .o size 0xCB2 = 3250 bytes).
 *
 * WHAT IT DOES  : Front-loads *all* per-combat state the EKR battle-animation
 *                 renderer needs before the battle plays: arena / link-arena
 *                 flags, EKR distance class (close / far / farfar / monocombat /
 *                 promotion), which BattleUnit sits on the left vs right and
 *                 whether each side is "valid" (drawn), battle-anim ids, unique
 *                 & faction palettes, terrain / floor-fx / background indices,
 *                 gauge HP / hit / dmg / crit, exp bars, weapon-triangle bonus
 *                 and effectiveness. Returns a bool "should the full battle
 *                 animation play?" (false => fall back to the map-quick combat).
 *
 * ------------------------------------------------------------------------------
 * REGION DIFFERENCE (JP original  vs  US localisation)  --  verified by aligning
 * the JP `bl` call sequence (asm/sub_8057F80.s) 1:1 against an objdump of the US
 * .o. 57 calls line up in lockstep; the deltas are:
 *
 *   MEASURED SIZE:  JP 0xB78 (2936B)  <  US 0xCB2 (3250B).  The JP original is
 *   ~314 bytes SMALLER than US (NOT larger -- the P9 task-card's "+266B larger"
 *   estimate is inverted; the US *added* logic during localisation).  Either
 *   way this is genuinely region-different and a byte match is out of scope.
 *
 *   [R1] Ally left/right decision (call #10):
 *          JP : guard is  GetSelectTargetCount() != 1
 *          US : guard is  GetBanimLinkArenaFlag() != true
 *        (the classic JP->US swap: the US replaced the original select-target
 *         count test with the link-arena multiplayer flag it introduced.)
 *
 *   [R2] Unique-palette-disable decision (call #47):
 *          JP : disable when  GetSelectTargetCount() == 1  || gPlaySt.config.unitColor
 *          US : disable when  GetBanimLinkArenaFlag() == true || gPlaySt.config.unitColor
 *
 *   [R3] Tail special-cases  --  US ONLY (absent in JP, the bulk of the +314B):
 *        The US inserts, between the ballista check and the final per-side
 *        sprite validation, a block of 9 extra GetItemIndex() calls (#58..#66):
 *          - Manakete/Myrrh immunity to sleep / berserk / silence / monster-stone
 *            staves+stone (8 GetItemIndex tests, each `return false`), and
 *          - a Demon-King `return true` fast-path
 *            (char_cnt != 1 && class == CLASS_DEMON_KING && weapon != NIGHTMARE
 *             && target not PHANTOM/DRACO_ZOMBIE).
 *        The JP build has NEITHER: after SetBattleUnscripted() it drops straight
 *        into `if (usrdefined_enable == false) return false;` and the per-side
 *        validation.  This reconstruction reflects the JP (no Myrrh/Demon-King
 *        block) so the control flow matches asm/sub_8057F80.s.
 *
 * BLOCKING DIFF (why byte-match is not pursued): beyond [R1]/[R2]/[R3] the two
 * builds diverge structurally (different callee at the guard sites shifts branch
 * layout, and the missing US tail block re-flows the whole return-value chain +
 * register allocation).  Per P10 strategy this outlier's deliverable is this
 * readable+documented NON_MATCHING C, not a forced byte match.
 * ------------------------------------------------------------------------------
 *
 * JP-address callees that gbadisasm left unnamed (asm/.s `.set` lines) resolved
 * to their fe8u names, used below for readability:
 *   sub_8050ABC = SetBanimLinkArenaFlag        GetBattleAnimationId = GetBattleAnimationId
 *   sub_8059790 = FilterBattleAnimCharacterPalette   sub_8059034 = ParseBattleHitToBanimCmd
 *   sub_8058E44 = GetSpellAnimId               sub_80598BC = IsItemDisplayedInBattle
 *   sub_8058FE8 = UnsetMapStaffAnim            sub_805BDCC = GetBattleAnimArenaFlag
 *   sub_80599A0 = SetBattleUnscripted
 *
 * Graduate (STRETCH ONLY) via permuter -> matching C: move to src/, flip the
 * carved_rom row asm->src, delete the .s; `make compare` must stay OK.
 */
#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "anime.h"
#include "spellassoc.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "uiselecttarget.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"

/* JP inlines the US `static inline GetBanimAllyPosition`, but with the [R1]
 * region-different guard: the original select-target count instead of the
 * US link-arena flag.  Kept as a static helper for readability; agbcc inlines
 * small statics anyway. */
static inline s16 GetBanimAllyPositionJ(int faction1, int faction2)
{
    int pos = EKR_POS_L;

    /* [R1] JP guard (US used GetBanimLinkArenaFlag() != true here). */
    if (GetSelectTargetCount() != 1)
    {
        if (FACTION_ID_BLUE == (s16)faction1)
            pos = EKR_POS_R;
        else if (FACTION_ID_RED == (s16)faction1)
            pos = EKR_POS_R;
        else if (FACTION_ID_GREEN == (s16)faction1 && FACTION_ID_GREEN == faction2)
            pos = EKR_POS_R;
    }

    return pos;
}

bool PrepareBattleGraphicsMaybe(void)
{
    u16 i;
    u16 pid, jid;
    void * zero;
    struct Unit * unit_bu1;
    struct Unit * unit_bu2;
    struct BattleUnit * bu1;
    struct BattleUnit * bu2;
    const struct CharacterData * pinfo1;
    const struct CharacterData * pinfo2;
    int usrdefined_enable;
    const void * animdef1;
    const void * animdef2;
    s16 valid_l;
    s16 valid_r;
    u32 animid1, animid2;

    int char_cnt = 1;

    ResetEkrDragonStatus();

    if (!(gBattleStats.config & BATTLE_CONFIG_ARENA))
        SetBanimArenaFlag(false);
    else
        SetBanimArenaFlag(true);

    /* JP still tracks the link-arena flag (sub_8050ABC = SetBanimLinkArenaFlag),
     * even though the L/R decision below reads GetSelectTargetCount() instead. */
    if (!(gBmSt.gameStateBits & BM_FLAG_LINKARENA))
        SetBanimLinkArenaFlag(false);
    else
        SetBanimLinkArenaFlag(true);

    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION)
        gEkrDistanceType = EKR_DISTANCE_PROMOTION;
    else
        gEkrDistanceType = EKR_DISTANCE_CLOSE;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        bu1 = gpEkrBattleUnitLeft = &gBattleActor;
        bu2 = gpEkrBattleUnitRight = &gBattleTarget;

        gBanimPositionIsEnemy[POS_L] = gBanimPositionIsEnemy[POS_R] = 0;
        gBanimValid[EKR_POS_R] = gBanimValid[EKR_POS_L] = true;
    }
    else
    {
        u8 i1 = -0x40 & gBattleActor.unit.index;
        u16 faction1 = GetBanimFactionPalette(i1);
        u8 i2 = -0x40 & gBattleTarget.unit.index;
        u16 faction2 = GetBanimFactionPalette(i2);

        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            char_cnt = 2;
        else if (gBattleActor.weaponBefore == ITEM_NONE)
            char_cnt = 2;
        else
            char_cnt = GetSpellAssocCharCount(GetItemIndex(gBattleActor.weaponBefore));

        gBanimValid[EKR_POS_L] = gBanimValid[EKR_POS_R] = true;

        if (EKR_POS_R == GetBanimAllyPositionJ(faction1, faction2))
        {
            bu1 = gpEkrBattleUnitLeft = &gBattleTarget;
            bu2 = gpEkrBattleUnitRight = &gBattleActor;

            gBanimPositionIsEnemy[POS_L] = true;
            gBanimPositionIsEnemy[POS_R] = false;

            if (char_cnt == 1)
                gBanimValid[EKR_POS_L] = false;
        }
        else
        {
            bu1 = gpEkrBattleUnitLeft = &gBattleActor;
            bu2 = gpEkrBattleUnitRight = &gBattleTarget;

            gBanimPositionIsEnemy[POS_L] = false;
            gBanimPositionIsEnemy[POS_R] = true;

            if (char_cnt == 1)
                gBanimValid[EKR_POS_R] = false;
        }
    }

    unit_bu1 = &bu1->unit;
    unit_bu2 = &bu2->unit;

    pinfo1 = unit_bu1->pCharacterData;
    pinfo2 = unit_bu2->pCharacterData;

    animdef1 = animdef2 = 0;

    valid_l = gBanimValid[POS_L];
    valid_r = gBanimValid[POS_R];

    if (valid_l)
        animdef1 = unit_bu1->pClassData->pBattleAnimDef;

    if (valid_r)
        animdef2 = unit_bu2->pClassData->pBattleAnimDef;

    if (valid_l)
    {
        gEkrBmLocation[POS_L] = (16 * unit_bu1->xPos - gBmSt.camera.x) >> 4;
        gEkrBmLocation[POS_R] = (16 * unit_bu1->yPos - gBmSt.camera.y) >> 4;
    }

    if (valid_r)
    {
        gEkrBmLocation[2] = (16 * unit_bu2->xPos - gBmSt.camera.x) >> 4;
        gEkrBmLocation[3] = (16 * unit_bu2->yPos - gBmSt.camera.y) >> 4;
    }

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (GetItemAttributes(gBattleActor.weaponBefore) & IA_UNCOUNTERABLE)
            gEkrDistanceType = EKR_DISTANCE_FARFAR;
        else
        {
            gEkrDistanceType = EKR_DISTANCE_MONOCOMBAT;

            if (valid_l + valid_r == 2)
            {
                s16 x_distance, y_distance;
                x_distance = ABS(gEkrBmLocation[POS_L] - gEkrBmLocation[2]);
                y_distance = ABS(gEkrBmLocation[1] - gEkrBmLocation[3]);

                if (x_distance + y_distance <= 1)
                    gEkrDistanceType = EKR_DISTANCE_CLOSE;
                else if (x_distance + y_distance <= 3)
                    gEkrDistanceType = EKR_DISTANCE_FAR;
                else
                    gEkrDistanceType = EKR_DISTANCE_FARFAR;
            }
        }
    }

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gBanimIdx[POS_L] = gBanimIdx_bak[POS_L] = GetBattleAnimationId(unit_bu1, animdef1, bu1->weapon, &animid1);
        gBanimIdx[POS_R] = gBanimIdx_bak[POS_R] = GetBattleAnimationId(unit_bu2, animdef2, bu2->weapon, &animid2);
    }
    else
    {
        if (valid_l)
            gBanimIdx[POS_L] = gBanimIdx_bak[POS_L] = GetBattleAnimationId(unit_bu1, animdef1, bu1->weaponBefore, &animid1);

        if (valid_r)
            gBanimIdx[POS_R] = gBanimIdx_bak[POS_R] = GetBattleAnimationId(unit_bu2, animdef2, bu2->weaponBefore, &animid2);
    }

    pid = unit_bu1->pCharacterData->number - 1;
    jid = unit_bu1->pClassData->number;

    if (valid_l)
        gBanimUniquePal[POS_L] = -1;

    for (i = 0; i < 7; i++)
    {
        if (gAnimCharaPalConfig[pid][i] == jid && valid_l)
        {
            gBanimUniquePal[POS_L] = gAnimCharaPalIt[pid][i] - 1;
            break;
        }
    }

    pid = unit_bu2->pCharacterData->number - 1;
    jid = unit_bu2->pClassData->number;

    if (valid_r)
        gBanimUniquePal[POS_R] = -1;

    for (i = 0; i < 7; i++)
    {
        if (gAnimCharaPalConfig[pid][i] == jid && valid_r)
        {
            gBanimUniquePal[POS_R] = gAnimCharaPalIt[pid][i] - 1;
            break;
        }
    }

    if (valid_l)
        gBanimTriAtkPalettes[POS_L] = (char *)FilterBattleAnimCharacterPalette(gBanimIdx[POS_L], bu1->weaponBefore);

    if (valid_r)
        gBanimTriAtkPalettes[POS_R] = (char *)FilterBattleAnimCharacterPalette(gBanimIdx[POS_R], bu2->weaponBefore);

    gBanimTerrain[POS_L] = bu1->terrainId;
    gBanimTerrain[POS_R] = bu2->terrainId;

    gBanimFloorfx[POS_L] = gBanimFloorfx[POS_R] = -1;

    if (valid_l)
        gBanimFloorfx[POS_L] =
            GetBanimTerrainGround(bu1->terrainId, GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);

    if (valid_r)
        gBanimFloorfx[POS_R] =
            GetBanimTerrainGround(bu2->terrainId, GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);

    if (gBmSt.gameStateBits & BM_FLAG_LINKARENA)
    {
        gBanimTerrain[POS_R] = gBanimTerrain[POS_L] = TERRAIN_ARENA_30;

        if (valid_l)
            gBanimFloorfx[POS_L] =
                GetBanimTerrainGround(gBanimTerrain[POS_L], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);

        if (valid_r)
            gBanimFloorfx[POS_R] =
                GetBanimTerrainGround(gBanimTerrain[POS_R], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);
    }

    if (CheckBanimHensei() == true)
    {
        gBanimFloorfx[POS_L] = gBanimFloorfx[POS_R] = 20;
        gBanimTerrain[POS_L] = gBanimTerrain[POS_R] = TERRAIN_ARENA_30;
    }

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
        case EKR_DISTANCE_MONOCOMBAT:
            break;

        case EKR_DISTANCE_PROMOTION:
            gBanimFloorfx[POS_L] = gBanimFloorfx[POS_R];
            break;
    }

    switch (gPlaySt.chapterWeatherId)
    {
        case WEATHER_SNOW:
        case WEATHER_SNOWSTORM:
            gEkrSnowWeather = 1;
            break;

        default:
            gEkrSnowWeather = 0;
            break;
    }

    if (valid_l)
        gBanimCon[POS_L] = unit_bu1->pClassData->baseCon;

    if (valid_r)
        gBanimCon[POS_R] = unit_bu2->pClassData->baseCon;

    if (valid_l)
    {
        gEkrGaugeHp[POS_L] = bu1->hpInitial;
        gBanimMaxHP[POS_L] = unit_bu1->maxHP;
    }

    if (valid_r)
    {
        gEkrGaugeHp[POS_R] = bu2->hpInitial;
        gBanimMaxHP[POS_R] = unit_bu2->maxHP;
    }

    ParseBattleHitToBanimCmd();

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gEkrSpellAnimIndex[POS_R] = 1;
        gEkrSpellAnimIndex[POS_L] = 1;
    }
    else
    {
        if (valid_l)
            gEkrSpellAnimIndex[POS_L] = GetSpellAnimId(unit_bu1->pClassData->number, bu1->weaponBefore);

        if (valid_r)
            gEkrSpellAnimIndex[POS_R] = GetSpellAnimId(unit_bu2->pClassData->number, bu2->weaponBefore);

        if (gBattleStats.config & BATTLE_CONFIG_REFRESH)
            if (!IsItemDisplayedInBattle(bu2->weaponBefore))
                if (unit_bu2->pClassData->number == CLASS_DANCER)
                    gEkrSpellAnimIndex[POS_R] = 0xF;
    }

    if (valid_l)
        UnsetMapStaffAnim(&gEkrSpellAnimIndex[POS_L], 0, bu1->weaponBefore);

    if (valid_r)
        UnsetMapStaffAnim(&gEkrSpellAnimIndex[POS_R], 1, bu2->weaponBefore);

    switch (gEkrDistanceType)
    {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            switch (unit_bu1->pClassData->number)
            {
                case CLASS_DRACO_ZOMBIE:
                    SetEkrDragonStatusType(gAnims[POS_L], EKRDRGON_TYPE_DRACO_ZOMBIE);
                    break;

                case CLASS_DEMON_KING:
                    SetEkrDragonStatusType(gAnims[POS_L], EKRDRGON_TYPE_DEMON_KING);
                    break;
            }
            break;

        case EKR_DISTANCE_MONOCOMBAT:
        case EKR_DISTANCE_PROMOTION:
            break;

        default:
            break;
    }

    if (valid_l)
    {
        u8 i1 = -0x40 & unit_bu1->index;
        gBanimFactionPal[POS_L] = GetBanimFactionPalette(i1);
    }

    if (valid_r)
    {
        u8 i2 = -0x40 & unit_bu2->index;
        gBanimFactionPal[POS_R] = GetBanimFactionPalette(i2);
    }

    gEkrPids[POS_R] = 0;
    gEkrPids[POS_L] = 0;

    if (valid_l)
        gEkrPids[POS_L] = pinfo1->number;

    if (valid_r)
        gEkrPids[POS_R] = pinfo2->number;

    if (valid_l)
        gEkrGaugeHit[POS_L] = bu1->battleEffectiveHitRate;

    if (valid_r)
        gEkrGaugeHit[POS_R] = bu2->battleEffectiveHitRate;

    if (gEkrGaugeHit[POS_L] == 0xFF)
        gEkrGaugeHit[POS_L] = -1;

    if (gEkrGaugeHit[POS_R] == 0xFF)
        gEkrGaugeHit[POS_R] = -1;

    if (valid_l)
    {
        gEkrGaugeDmg[POS_L] = bu1->battleAttack - bu2->battleDefense;
        if (gEkrGaugeDmg[POS_L] < 0)
            gEkrGaugeDmg[POS_L] = 0;

        if (bu1->battleAttack == 0xFF)
            gEkrGaugeDmg[POS_L] = -1;

        if (GetItemIndex(bu1->weapon) == ITEM_MONSTER_STONE)
            gEkrGaugeDmg[POS_L] = -1;
    }

    if (valid_r)
    {
        gEkrGaugeDmg[POS_R] = bu2->battleAttack - bu1->battleDefense;
        if (gEkrGaugeDmg[POS_R] < 0)
            gEkrGaugeDmg[POS_R] = 0;

        if (bu2->battleAttack == 0xFF)
            gEkrGaugeDmg[POS_R] = -1;

        if (GetItemIndex(bu2->weapon) == ITEM_MONSTER_STONE)
            gEkrGaugeDmg[POS_R] = -1;
    }

    if (valid_l)
        gEkrGaugeCrt[POS_L] = bu1->battleEffectiveCritRate;

    if (valid_r)
        gEkrGaugeCrt[POS_R] = bu2->battleEffectiveCritRate;

    if (gEkrGaugeCrt[POS_L] == 0xFF)
        gEkrGaugeCrt[POS_L] = -1;

    if (gEkrGaugeCrt[POS_R] == 0xFF)
        gEkrGaugeCrt[POS_R] = -1;

    if (GetItemIndex(bu1->weapon) == ITEM_MONSTER_STONE)
        gEkrGaugeCrt[POS_L] = -1;

    if (GetItemIndex(bu2->weapon) == ITEM_MONSTER_STONE)
        gEkrGaugeCrt[POS_R] = -1;

    if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
    {
        gEkrGaugeHit[POS_R] = -1;
        gEkrGaugeDmg[POS_R] = -1;
        gEkrGaugeCrt[POS_R] = -1;
    }

    if (valid_l)
        gBanimExpPrevious[POS_L] = (s8)bu1->expPrevious;

    if (valid_r)
        gBanimExpPrevious[POS_R] = (s8)bu2->expPrevious;

    if (valid_l)
        gBanimExpGain[POS_L] = bu1->expGain;

    if (valid_r)
        gBanimExpGain[POS_R] = bu2->expGain;

    gBanimWtaBonus[POS_R] = 0;
    gBanimWtaBonus[POS_L] = 0;

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (valid_l)
            gBanimWtaBonus[POS_L] = bu1->wTriangleHitBonus;

        if (valid_r)
            gBanimWtaBonus[POS_R] = bu2->wTriangleHitBonus;

        if (valid_l)
            gBanimEffectiveness[POS_L] = IsUnitEffectiveAgainst(unit_bu1, unit_bu2);

        if (valid_r)
            gBanimEffectiveness[POS_R] = IsUnitEffectiveAgainst(unit_bu2, unit_bu1);

        if (!gBanimEffectiveness[POS_L] && valid_l)
            gBanimEffectiveness[POS_L] = IsItemEffectiveAgainst(bu1->weapon, unit_bu2);

        if (!gBanimEffectiveness[POS_R] && valid_r)
            gBanimEffectiveness[POS_R] = IsItemEffectiveAgainst(bu2->weapon, unit_bu1);
    }

    gBanimForceUnitChgDebug[POS_L] = gBanimForceUnitChgDebug[POS_R] = zero = 0;

    if (valid_l)
        (void)GetItemIndex(bu1->weaponBefore);

    if (valid_r)
        (void)GetItemIndex(bu2->weaponBefore);

    /* [R2] JP guard: GetSelectTargetCount()==1 (US used GetBanimLinkArenaFlag()==true). */
    if (GetSelectTargetCount() == 1 || gPlaySt.config.unitColor)
        gBanimUniquePaletteDisabled[POS_L] = gBanimUniquePaletteDisabled[POS_R] = 1;
    else
        gBanimUniquePaletteDisabled[POS_L] = gBanimUniquePaletteDisabled[POS_R] = 0;

    ++zero; --zero; /* matches the US no-op scratch use */

    gBanimBG = 0;

    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_ON_UNIQUE_BG)
    {
        if (gBanimValid[POS_L] != false)
            gBanimBG =
                GetBanimBackgroundIndex(gBanimTerrain[POS_L], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);
        else
            gBanimBG =
                GetBanimBackgroundIndex(gBanimTerrain[POS_R], GetROMChapterStruct(gPlaySt.chapterIndex)->battleTileSet);
    }

    if (CheckBanimHensei() == 1)
        gBanimBG = 0x3C;

    usrdefined_enable = false;
    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_ON)
        usrdefined_enable = true;
    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_ON_UNIQUE_BG)
        usrdefined_enable = true;
    if (GetBattleAnimPreconfType() == PLAY_ANIMCONF_OFF)
    {
        /* Banim still displays for: promotion, arena, or scripted battle. */
        if (gEkrDistanceType == EKR_DISTANCE_PROMOTION)
            usrdefined_enable = true;
        if (GetBattleAnimArenaFlag() == true)
            usrdefined_enable = true;
        if (CheckBattleScripted() == true)
            usrdefined_enable = true;
    }

    SetBattleUnscripted();

    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
    {
        if (unit_bu1->state & US_IN_BALLISTA)
            return false;

        if (unit_bu2->state & US_IN_BALLISTA)
            return false;
    }

    /* [R3] The US Manakete/Myrrh staff-immunity block and Demon-King fast-path
     * (9 extra GetItemIndex calls) DO NOT exist in the JP build -- omitted here
     * so control flow matches asm/sub_8057F80.s. */

    if (usrdefined_enable == false)
        return false;

    if (gBanimValid[POS_L] == true)
    {
        if (unit_bu1->statusIndex == UNIT_STATUS_BERSERK)
            return false;

        if (gBanimIdx[POS_L] == -1)
            return false;

        if (gEkrSpellAnimIndex[POS_L] == -2)
            return false;

        if (gBanimFloorfx[POS_L] == -1)
            return false;

        if (gBanimTerrain[POS_L] == TERRAIN_WALL_DAMAGED)
            return false;

        if (gBanimTerrain[POS_L] == TERRAIN_SNAG)
            return false;
    }

    if (gBanimValid[POS_R] == true)
    {
        if (unit_bu2->statusIndex == UNIT_STATUS_BERSERK)
            return false;

        if (gBanimIdx[POS_R] == -1)
            return false;

        if (gEkrSpellAnimIndex[POS_R] == -2)
            return false;

        if (gBanimFloorfx[POS_R] == -1)
            return false;

        if (gBanimTerrain[POS_R] == TERRAIN_WALL_DAMAGED)
            return false;

        if (gBanimTerrain[POS_R] == TERRAIN_SNAG)
            return false;
    }

    return true;
}
