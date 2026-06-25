#include "global.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bm.h"

extern struct ProcCmd gProcScr_85B9D0C[];
extern void sub_8012340(struct Unit* unit, u8 b, u8 c);

struct Proc8010CB4Child
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x58);
    /* 58 */ struct EventEngineProc* unk58;
    /* 5C */ STRUCT_PAD(0x5C, 0x64);
    /* 64 */ u16 unk64;
};

int sub_8010CB4(struct EventEngineProc* proc)
{
    const s16* cmd = (const s16*)proc->pEventCurrent;
    s16 a = cmd[1];
    s16 b = cmd[2];
    s16 c = cmd[3];
    struct Proc8010CB4Child* child;
    struct Unit* unit;

    child = Proc_StartBlocking(gProcScr_85B9D0C, proc);
    child->unk58 = proc;
    child->unk64 = (u8)GetGameLock();

    Proc_SetMark(proc, 7);

    unit = GetUnitStructFromEventParameter(a);
    SetUnitStatus(unit, 0);
    sub_8012340(unit, (u8)b, (u8)c);

    return 2;
}
