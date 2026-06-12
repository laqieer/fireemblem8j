#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"
#include "sio.h"








void WriteMultiArenaSaveTeamName(int team, char *name)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(name, dst_sram->teams[team].name, MULTIARENA_TEAMNAME_SIZE + 1);

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}
