#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"

extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;





void WriteMultiArenaSaveTeam(int team, struct Unit *units_src, char const *name_src)
{
    struct SaveBlockInfo block_info;
    int i;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(name_src, dst_sram->teams[team].name, sizeof(dst_sram->teams[team].name));

    for (i = 0; i < MULTIARENA_UNITS_PER_TEAM; i++)
        WriteGameSavePackedUnit(&units_src[i], &dst_sram->teams[team].units[i]);

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
