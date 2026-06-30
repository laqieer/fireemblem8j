#include "global.h"

#include "soundroom.h"

#include "constants/songs.h"
#include "constants/msg.h"

/* Decompiled from the JP gSoundRoomTable (region-same vs fe8u src/soundroom_data.c).
 * bgmId / songLength / displayCondFunc (NULL) are byte-identical to fe8u; only
 * nameTextId differs, by the JP msgid shift (= fe8u MSG_* value - 0x89). The table
 * is pinned to .rodata.dat_gSoundRoomTable_ref by ldscript.txt (its JP home), so it
 * keeps the explicit SECTION rather than CONST_DATA's .data placement.
 */

SECTION(".rodata.dat_gSoundRoomTable_ref") struct SoundRoomEnt gSoundRoomTable[] =
{
    {
        .bgmId = SONG_THE_VALIANT,
        .songLength = 2640,
        .displayCondFunc = NULL,
        .nameTextId = MSG_702,
    },
    {
        .bgmId = SONG_MAIN_THEME_EXT,
        .songLength = 5880,
        .displayCondFunc = NULL,
        .nameTextId = MSG_703,
    },
    {
        .bgmId = SONG_PROLOGUE,
        .songLength = 4140,
        .displayCondFunc = NULL,
        .nameTextId = MSG_704,
    },
    {
        .bgmId = SONG_THE_BEGINNING,
        .songLength = 3720,
        .displayCondFunc = NULL,
        .nameTextId = MSG_705,
    },
    {
        .bgmId = SONG_TREASURED_MEMORIES,
        .songLength = 4560,
        .displayCondFunc = NULL,
        .nameTextId = MSG_706,
    },
    {
        .bgmId = SONG_GRIM_JOURNEY,
        .songLength = 4440,
        .displayCondFunc = NULL,
        .nameTextId = MSG_707,
    },
    {
        .bgmId = SONG_TIES_OF_FRIENDSHIP,
        .songLength = 3840,
        .displayCondFunc = NULL,
        .nameTextId = MSG_708,
    },
    {
        .bgmId = SONG_RAY_OF_HOPE,
        .songLength = 3900,
        .displayCondFunc = NULL,
        .nameTextId = MSG_709,
    },
    {
        .bgmId = SONG_DISTANT_ROADS,
        .songLength = 6420,
        .displayCondFunc = NULL,
        .nameTextId = MSG_70A,
    },
    {
        .bgmId = SONG_RISE_ABOVE,
        .songLength = 5640,
        .displayCondFunc = NULL,
        .nameTextId = MSG_70B,
    },
    {
        .bgmId = SONG_FOLLOW_ME,
        .songLength = 4980,
        .displayCondFunc = NULL,
        .nameTextId = MSG_70C,
    },
    {
        .bgmId = SONG_DETERMINATION,
        .songLength = 4560,
        .displayCondFunc = NULL,
        .nameTextId = MSG_70D,
    },
    {
        .bgmId = SONG_TRUTH_DESPAIR_AND_HOPE,
        .songLength = 5820,
        .displayCondFunc = NULL,
        .nameTextId = MSG_70E,
    },
    {
        .bgmId = SONG_LAND_OF_PROMISE,
        .songLength = 4680,
        .displayCondFunc = NULL,
        .nameTextId = MSG_70F,
    },
    {
        .bgmId = SONG_BINDING_VOW,
        .songLength = 3840,
        .displayCondFunc = NULL,
        .nameTextId = MSG_710,
    },
    {
        .bgmId = SONG_GRASP_AT_VICTORY,
        .songLength = 2460,
        .displayCondFunc = NULL,
        .nameTextId = MSG_711,
    },
    {
        .bgmId = SONG_CONFRONT_THE_PAST,
        .songLength = 4980,
        .displayCondFunc = NULL,
        .nameTextId = MSG_712,
    },
    {
        .bgmId = SONG_SHADOWS_APPROACH,
        .songLength = 5640,
        .displayCondFunc = NULL,
        .nameTextId = MSG_713,
    },
    {
        .bgmId = SONG_SHADOW_OF_THE_ENEMY,
        .songLength = 2820,
        .displayCondFunc = NULL,
        .nameTextId = MSG_714,
    },
    {
        .bgmId = SONG_ASSAULT,
        .songLength = 5100,
        .displayCondFunc = NULL,
        .nameTextId = MSG_715,
    },
    {
        .bgmId = SONG_FROM_THE_DARKNESS,
        .songLength = 4380,
        .displayCondFunc = NULL,
        .nameTextId = MSG_716,
    },
    {
        .bgmId = SONG_TWISTED_SHADOWS_A,
        .songLength = 4440,
        .displayCondFunc = NULL,
        .nameTextId = MSG_717,
    },
    {
        .bgmId = SONG_TWISTED_SHADOWS_B,
        .songLength = 4440,
        .displayCondFunc = NULL,
        .nameTextId = MSG_718,
    },
    {
        .bgmId = SONG_ENVOY_FROM_THE_DARK,
        .songLength = 4980,
        .displayCondFunc = NULL,
        .nameTextId = MSG_719,
    },
    {
        .bgmId = SONG_ATTACK,
        .songLength = 1500,
        .displayCondFunc = NULL,
        .nameTextId = MSG_71A,
    },
    {
        .bgmId = SONG_DEFENSE,
        .songLength = 1680,
        .displayCondFunc = NULL,
        .nameTextId = MSG_71B,
    },
    {
        .bgmId = SONG_THE_BATTLE_MUST_BE_WON,
        .songLength = 1680,
        .displayCondFunc = NULL,
        .nameTextId = MSG_71C,
    },
    {
        .bgmId = SONG_POWERFUL_FOE,
        .songLength = 1440,
        .displayCondFunc = NULL,
        .nameTextId = MSG_71D,
    },
    {
        .bgmId = SONG_THE_PRINCES_DESPAIR,
        .songLength = 2040,
        .displayCondFunc = NULL,
        .nameTextId = MSG_71E,
    },
    {
        .bgmId = SONG_RETURN_OF_THE_DEMON_KING,
        .songLength = 3840,
        .displayCondFunc = NULL,
        .nameTextId = MSG_71F,
    },
    {
        .bgmId = SONG_SACRED_STRENGTH,
        .songLength = 660,
        .displayCondFunc = NULL,
        .nameTextId = MSG_720,
    },
    {
        .bgmId = SONG_TETHYS,
        .songLength = 1440,
        .displayCondFunc = NULL,
        .nameTextId = MSG_721,
    },
    {
        .bgmId = SONG_HEALING,
        .songLength = 840,
        .displayCondFunc = NULL,
        .nameTextId = MSG_722,
    },
    {
        .bgmId = SONG_CURING,
        .songLength = 660,
        .displayCondFunc = NULL,
        .nameTextId = MSG_723,
    },
    {
        .bgmId = SONG_TO_A_HIGHER_PLACE,
        .songLength = 1800,
        .displayCondFunc = NULL,
        .nameTextId = MSG_724,
    },
    {
        .bgmId = SONG_ADVANCE,
        .songLength = 3180,
        .displayCondFunc = NULL,
        .nameTextId = MSG_725,
    },
    {
        .bgmId = SONG_TENSION,
        .songLength = 2040,
        .displayCondFunc = NULL,
        .nameTextId = MSG_726,
    },
    {
        .bgmId = SONG_RAID,
        .songLength = 2520,
        .displayCondFunc = NULL,
        .nameTextId = MSG_727,
    },
    {
        .bgmId = SONG_REUNION,
        .songLength = 2700,
        .displayCondFunc = NULL,
        .nameTextId = MSG_728,
    },
    {
        .bgmId = SONG_INDIGNATION,
        .songLength = 2940,
        .displayCondFunc = NULL,
        .nameTextId = MSG_729,
    },
    {
        .bgmId = SONG_SORROW,
        .songLength = 3180,
        .displayCondFunc = NULL,
        .nameTextId = MSG_72A,
    },
    {
        .bgmId = SONG_LAUGHTER,
        .songLength = 2160,
        .displayCondFunc = NULL,
        .nameTextId = MSG_72B,
    },
    {
        .bgmId = SONG_LEGACY,
        .songLength = 4200,
        .displayCondFunc = NULL,
        .nameTextId = MSG_72C,
    },
    {
        .bgmId = SONG_LYON,
        .songLength = 2880,
        .displayCondFunc = NULL,
        .nameTextId = MSG_72D,
    },
    {
        .bgmId = SONG_LOST_HEART,
        .songLength = 3720,
        .displayCondFunc = NULL,
        .nameTextId = MSG_72E,
    },
    {
        .bgmId = SONG_LYON_ORGAN_ARRANGEMENT,
        .songLength = 3900,
        .displayCondFunc = NULL,
        .nameTextId = MSG_72F,
    },
    {
        .bgmId = SONG_THE_FINAL_BATTLE,
        .songLength = 2880,
        .displayCondFunc = NULL,
        .nameTextId = MSG_730,
    },
    {
        .bgmId = SONG_SOLVE_THE_RIDDLE,
        .songLength = 3300,
        .displayCondFunc = NULL,
        .nameTextId = MSG_731,
    },
    {
        .bgmId = SONG_LIGHTS_IN_THE_DARK,
        .songLength = 3420,
        .displayCondFunc = NULL,
        .nameTextId = MSG_732,
    },
    {
        .bgmId = SONG_COMRADES,
        .songLength = 2160,
        .displayCondFunc = NULL,
        .nameTextId = MSG_733,
    },
    {
        .bgmId = SONG_VICTORY,
        .songLength = 3120,
        .displayCondFunc = NULL,
        .nameTextId = MSG_734,
    },
    {
        .bgmId = SONG_INTO_THE_SHADOW_OF_VICTORY,
        .songLength = 2220,
        .displayCondFunc = NULL,
        .nameTextId = MSG_735,
    },
    {
        .bgmId = SONG_MAIN_THEME_REPRISE,
        .songLength = 3960,
        .displayCondFunc = NULL,
        .nameTextId = MSG_736,
    },
    {
        .bgmId = SONG_COMBAT_PREPARATION,
        .songLength = 3960,
        .displayCondFunc = NULL,
        .nameTextId = MSG_737,
    },
    {
        .bgmId = SONG_SHOPS,
        .songLength = 1260,
        .displayCondFunc = NULL,
        .nameTextId = MSG_738,
    },
    {
        .bgmId = SONG_ARMORIES,
        .songLength = 1080,
        .displayCondFunc = NULL,
        .nameTextId = MSG_739,
    },
    {
        .bgmId = SONG_BONDS,
        .songLength = 900,
        .displayCondFunc = NULL,
        .nameTextId = MSG_73A,
    },
    {
        .bgmId = SONG_COLOSSEUM_ENTRANCE,
        .songLength = 2520,
        .displayCondFunc = NULL,
        .nameTextId = MSG_73B,
    },
    {
        .bgmId = SONG_IN_THE_COLOSSEUM,
        .songLength = 1740,
        .displayCondFunc = NULL,
        .nameTextId = MSG_73C,
    },
    {
        .bgmId = SONG_COLOSSEUM_VICTORY,
        .songLength = 360,
        .displayCondFunc = NULL,
        .nameTextId = MSG_73D,
    },
    {
        .bgmId = SONG_COLOSSEUM_DEFEAT,
        .songLength = 1320,
        .displayCondFunc = NULL,
        .nameTextId = MSG_73E,
    },
    {
        .bgmId = SONG_VICTORY_SONG_A,
        .songLength = 420,
        .displayCondFunc = NULL,
        .nameTextId = MSG_73F,
    },
    {
        .bgmId = SONG_VICTORY_SONG_B,
        .songLength = 420,
        .displayCondFunc = NULL,
        .nameTextId = MSG_740,
    },
    {
        .bgmId = SONG_GAME_OVER,
        .songLength = 2160,
        .displayCondFunc = NULL,
        .nameTextId = MSG_741,
    },
    {
        .bgmId = SONG_IN_SORROWS_SHROUD,
        .songLength = 1620,
        .displayCondFunc = NULL,
        .nameTextId = MSG_742,
    },
    {
        .bgmId = SONG_RECORDS,
        .songLength = 2760,
        .displayCondFunc = NULL,
        .nameTextId = MSG_743,
    },
    {
        .bgmId = SONG_VICTORY_AND_THE_FUTURE,
        .songLength = 6240,
        .displayCondFunc = NULL,
        .nameTextId = MSG_744,
    },
    {
        .bgmId = SONG_FLY_WITH_THE_BREEZE,
        .songLength = 9120,
        .displayCondFunc = NULL,
        .nameTextId = MSG_745,
    },
    {
        .bgmId = SONG_EPILOGUE,
        .songLength = 9360,
        .displayCondFunc = NULL,
        .nameTextId = MSG_746,
    },
    {
        .bgmId = -1,
    },
};
