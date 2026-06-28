#include "global.h"
#include "proc.h"

extern void MapAnim_BeginSubjectFastAnim(ProcPtr proc);
extern void MapAnim_MoveSubjectsTowardsTarget(ProcPtr proc);
extern void MapAnim_MoveCameraOnTarget(ProcPtr proc);
extern void MapAnim_BeginRoundSpecificAnims(ProcPtr proc);
extern void MapAnim_WaitForHPToEndChangingMaybe(ProcPtr proc);
extern void MapAnim_MoveSubjectsAwayFromTarget(ProcPtr proc);

struct ProcCmd ProcScr_MapAnimDefaultItemEffect[] __attribute__((section(".rodata.dat_ProcScr_MapAnimDefaultItemEffect_ref"))) = {
    PROC_CALL(MapAnim_BeginSubjectFastAnim),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveSubjectsTowardsTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveCameraOnTarget),
    PROC_SLEEP(2),
    PROC_CALL(MapAnim_BeginRoundSpecificAnims),
    PROC_SLEEP(8),
    PROC_REPEAT(MapAnim_WaitForHPToEndChangingMaybe),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_MoveSubjectsAwayFromTarget),
    PROC_SLEEP(0x14),
    PROC_END,
};
