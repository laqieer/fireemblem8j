#include "global.h"
#include "proc.h"
#include "mapanim.h"
#include "bmio.h"

struct ProcCmd ProcScr_SpellAssocSleep[] __attribute__((section(".rodata.dat_ProcScr_SpellAssocSleep_ref"))) = {
    PROC_CALL(DisableMapPaletteAnimations),
    PROC_CALL(MapAnimStartSpellAssocFade),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(0x2),
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocSleep),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x8C),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimSpellAssocResetPal),
    PROC_SLEEP(0x1),
    PROC_CALL(ResetMapPaletteAnimations),
    PROC_END,
};
