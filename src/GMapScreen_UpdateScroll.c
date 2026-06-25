#include "global.h"

#include "worldmap.h"

void GMapScreen_ApplyTilePalettes(struct GmScreenProc * proc);
void GMapScreenVSync_RequestFullCopy(ProcPtr proc, int a, int b);
s8 GMapScreenVSync_AddCopyRequest(struct GMapScreenVSyncProc * proc, int arg1, int arg2, int arg3, int arg4, int arg5, int arg6);

//! FE8U = 0x080BA8A0
void GMapScreen_UpdateScroll(struct GmScreenProc * proc)
{
    s16 r4, r5, r6, r9;
    s16 a, iVar6;
    s32 b;

    if (proc->unk_2b != proc->unk_2d)
    {
        GMapScreen_ApplyTilePalettes(proc);

        if (ABS(proc->unk_2d - proc->unk_2b) > 1)
        {
            GMapScreenVSync_RequestFullCopy(proc->unk_48, proc->unk_2d, proc->unk_2e);
            proc->unk_2b = proc->unk_2d;
            proc->unk_2c = proc->unk_2e;
            return;
        }

        if (proc->unk_2d > proc->unk_2b)
        {
            r4 = (proc->unk_2d + 0x1e);
            r6 = r4 % 0x3c;
        }
        else
        {
            r6 = proc->unk_2d;
            r4 = r6;
        }

        r5 = (proc->unk_2e % 0x28);

        if (r5 + 0x15 < 0x28)
            a = 0x15;
        else
            a = 0x28 - r5;

        GMapScreenVSync_AddCopyRequest(proc->unk_48, r6, r5, r4, proc->unk_2e, 1, a);
        proc->unk_2b = proc->unk_2d;
    }

    if (proc->unk_2c != proc->unk_2e)
    {
        GMapScreen_ApplyTilePalettes(proc);

        if (ABS(proc->unk_2e - proc->unk_2c) > 1)
        {
            GMapScreenVSync_RequestFullCopy(proc->unk_48, proc->unk_2d, proc->unk_2e);
            proc->unk_2b = proc->unk_2d;
            proc->unk_2c = proc->unk_2e;
            return;
        }

        if (proc->unk_2e > proc->unk_2c)
        {
            r9 = proc->unk_2e + 0x14;
            r5 = r9;
            r5 = r5 % 0x28;
        }
        else
        {
            r5 = proc->unk_2e;
            r9 = r5;
        }

        b = (proc->unk_2d - (proc->unk_2d / 32) * 32);
        r4 = (s8)b;
        r6 = proc->unk_2d % 0x3c;

        if (r4 < 1)
            GMapScreenVSync_AddCopyRequest(proc->unk_48, r6, r5, r4, r9, 0x1f, 1);
        else
        {
            s16 tmp;
            iVar6 = (0x20 - r4);
            GMapScreenVSync_AddCopyRequest(proc->unk_48, r6, r5, r4, r9, iVar6, 1);
            tmp = (0x1f - iVar6);
            GMapScreenVSync_AddCopyRequest(proc->unk_48, r6 + iVar6, r5, r4 + iVar6, r9, tmp, 1);
        }
        proc->unk_2c = proc->unk_2e;
    }
}
