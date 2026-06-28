#include "global.h"
#include "proc.h"

extern void MapAnim_MoveCameraOnTarget(ProcPtr proc);
extern void SpellWarpStartFlashFade(ProcPtr proc);
extern void MapAnim_BeginRoundSpecificAnims(ProcPtr proc);
extern void MapAnim_WaitForHPToEndChangingMaybe(ProcPtr proc);
extern void MapAnim_Poison2ResetMap(ProcPtr proc);

struct ProcCmd ProcScr_EggDmgMapEffect1[] __attribute__((section(".rodata.dat_ProcScr_EggDmgMapEffect1_ref"))) = {
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(2),
    PROC_CALL(SpellWarpStartFlashFade),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(5),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(5),
    PROC_CALL(MapAnim_Poison2ResetMap),
    PROC_END,
};
