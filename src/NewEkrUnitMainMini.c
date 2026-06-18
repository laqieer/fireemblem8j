#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

extern struct ProcCmd ProcScr_ekrUnitMainMini[];

struct ProcEkrUnitMainMini
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ void * unk_5C;
};

void NewEkrUnitMainMini(struct AnimBuffer * pAnimBuf)
{
    struct ProcEkrUnitMainMini * proc = Proc_Start(ProcScr_ekrUnitMainMini, PROC_TREE_4);
    InitMainMiniAnim(pAnimBuf);

    proc->unk_5C = pAnimBuf;

    pAnimBuf->unk_34 = proc;
    pAnimBuf->unk_00 = 1;

    return;
}
