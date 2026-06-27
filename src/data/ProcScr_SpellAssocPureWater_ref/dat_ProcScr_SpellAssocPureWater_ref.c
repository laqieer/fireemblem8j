#include "global.h"
#include "proc.h"
#include "mapanim.h"

struct ProcCmd ProcScr_SpellAssocPureWater[] __attribute__((section(".rodata.dat_ProcScr_SpellAssocPureWater_ref"))) = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocPureWater),
    PROC_SLEEP(0x2),
    PROC_SLEEP(0x46),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END,
};
