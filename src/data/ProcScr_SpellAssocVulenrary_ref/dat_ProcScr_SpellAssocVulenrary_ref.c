#include "global.h"
#include "proc.h"
#include "mapanim.h"

struct ProcCmd ProcScr_SpellAssocVulenrary[] __attribute__((section(".rodata.dat_ProcScr_SpellAssocVulenrary_ref"))) = {
    PROC_CALL(MapAnim_AnimateSubjectIdle),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnimCallSpellAssocVulenrary),
    PROC_SLEEP(0x1E),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_SLEEP(0xA),
    PROC_CALL(MapAnim_SubjectResetAnim),
    PROC_SLEEP(0x1E),
    PROC_END,
};
