#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"




int CONST_DATA sArenaCpTeamNameLut[] = {
    0x2BF,      /* Lord */
    0x2CC,      /* Sniper */
    0x2E1,      /* Shaman */
    0x2C1,      /* Cavalier */
    0x2DC,      /* Fighter */
    0x2DD,      /* Warrior */
    0x2C3,      /* Knight */
    0x2C4,      /* General */
    0x2CB,      /* Archer */
    0x2E2,      /* Druid */
};

struct MultiArenaRankingEnt const gInitialMultiArenaRankings[MULTIARENA_MAX_RANKINGS] = {
    [0] = {
        .ranking = 0,
        .player_count = 1,
        .mode = 0,
        .points = 100,
        .name = { 0x81, 0x40, 0, },
    },
    [1] = {
        .ranking = 0,
        .player_count = 1,
        .mode = 1,
        .points = 90,
        .name = { 0x81, 0x40, 0, },
    },
    [2] = {
        .ranking = 0,
        .player_count = 1,
        .mode = 0,
        .points = 80,
        .name = { 0x81, 0x40, 0, },
    },
    [3] = {
        .ranking = 0,
        .player_count = 2,
        .mode = 1,
        .points = 70,
        .name = { 0x81, 0x40, 0, },
    },
    [4] = {
        .ranking = 0,
        .player_count = 2,
        .mode = 0,
        .points = 60,
        .name = { 0x81, 0x40, 0, },
    },
    [5] = {
        .ranking = 1,
        .player_count = 2,
        .mode = 1,
        .points = 50,
        .name = { 0x81, 0x40, 0, },
    },
    [6] = {
        .ranking = 1,
        .player_count = 3,
        .mode = 0,
        .points = 40,
        .name = { 0x81, 0x40, 0, },
    },
    [7] = {
        .ranking = 1,
        .player_count = 3,
        .mode = 1,
        .points = 30,
        .name = { 0x81, 0x40, 0, },
    },
    [8] = {
        .ranking = 1,
        .player_count = 3,
        .mode = 0,
        .points = 20,
        .name = { 0x81, 0x40, 0, },
    },
    [9] = {
        .ranking = 1,
        .player_count = 3,
        .mode = 1,
        .points = 10,
        .name = { 0x81, 0x40, 0, },
    },
};

void WriteNewMultiArenaSave(void)
{
    int i, j;
    char rank_name[MULTIARENA_TEAMNAME_SIZE + 4];
    struct SaveBlockInfo block_info;
    struct GameSavePackedUnit save_unit;
    char team_name[MULTIARENA_TEAMNAME_SIZE + 2];
    struct MultiArenaRankingEnt ranking_ent;
    u16 config;

    struct MultiArenaSaveBlock * dst = GetSaveWriteAddr(SAVE_ID_ARENA);

    CpuFill16(0, &save_unit, sizeof(save_unit));
    CpuFill16(0, team_name, MULTIARENA_TEAMNAME_SIZE + 1);

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++) {
        for (j = 0; j < MULTIARENA_UNITS_PER_TEAM; j++)
            WriteAndVerifySramFast(&save_unit, &dst->teams[i].units[j], sizeof(save_unit));

        WriteAndVerifySramFast(team_name, dst->teams[i].name, sizeof(dst->teams[i].name));
    }

    config = MULTIARENA_CONFIG_SHOWUNITS | MULTIARENA_CONFIG_SURVIVALMODE | MULTIARENA_CONFIG_AUTOEQUIPOFF;
    WriteAndVerifySramFast(&config, &dst->config, sizeof(config));

    for (i = 0; i < MULTIARENA_MAX_RANKINGS; i++) {
        ranking_ent.ranking = gInitialMultiArenaRankings[i].ranking;
        ranking_ent.player_count = gInitialMultiArenaRankings[i].player_count;
        ranking_ent.mode = gInitialMultiArenaRankings[i].mode;
        ranking_ent.points = gInitialMultiArenaRankings[i].points;

        GetStringFromIndexInBuffer(sArenaCpTeamNameLut[i], rank_name);
        SioStrCpy(rank_name, ranking_ent.name);
        WriteAndVerifySramFast(&ranking_ent, &dst->rankings[i], sizeof(ranking_ent));
    }

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
