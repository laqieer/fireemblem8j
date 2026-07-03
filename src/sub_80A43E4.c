#include "global.h"
#include "proc.h"
#include "cgtext.h"
#include "functions.h"
#include "variables.h"

extern int GetChapterDivinationTextIdHectorStory(void);
extern void StartCgText(int a, int b, int c, int d, int e, void * f, int g, void * h);

/* JP-only augury (占い) CG/illustration text init. No fe8u twin.
 * Stores a CG handle into proc->unk2C, sets up a CG draw via StartCgText
 * (VRAM dest 0x06011000), then OR's the CG text flags with 0x0004000A. */

struct Unk80A43E4Proc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
};

void sub_80A43E4(struct Unk80A43E4Proc * proc)
{
    int v = GetChapterDivinationTextIdHectorStory();

    proc->unk2C = v;

    StartCgText(0x16, 0x10, -1, -1, v, (void *)0x06011000 /* BG VRAM */, -1, proc);

    SetCgTextFlags(GetCgTextFlags() | 0x0004000A);
}
