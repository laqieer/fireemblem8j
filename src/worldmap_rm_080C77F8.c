#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"

#include "worldmap.h"
#include "constants/worldmap.h"



//! FE8U = 0x080C2A40
int StartGmapRmBorder1(void)
{
    int i;
    int j;
    int count;
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    int local_18[3];

    count = 0;

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);

    do
    {
        proc = Proc_FindNext(&procIter);
        if (proc == NULL)
        {
            break;
        }

        local_18[count] = proc->unk_2b;

        count++;
    } while (1);

    if (count == 0)
    {
        return 0;
    }

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < count && i != local_18[j]; j++)
        {
        }

        if (j == count)
        {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x080C2AAC
void DrawWmNationHighLightMapGfx(int chr, int index)
{
    void * vram = (void *)(0x06010000 + chr * 0x1000);
    Decompress(GfxSet_WmNationMap[index].img, vram);

    return;
}

//! FE8U = 0x080C2AD4
ProcPtr WmShowNationHighlightedMap(int index, ProcPtr parent)
{
    int countMaybe;
    struct ProcGmapRmBorder1 * proc;

    countMaybe = StartGmapRmBorder1();

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapRmBorder1, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapRmBorder1, PROC_TREE_3);
    }

    DrawWmNationHighLightMapGfx(countMaybe, index);

    proc->sprite1 = AP_Create(GfxSet_WmNationMap[index].sprite, 0xd);

    proc->sprite1->tileBase = ((countMaybe << 12) >> 5) | -0x6400;
    AP_SwitchAnimation(proc->sprite1, 0);

    proc->sprite2 = AP_Create(GfxSet_WmNationMap[index].sprite, 0xd);
    proc->sprite2->tileBase = ((countMaybe << 12) >> 5) | -0x6400;
    AP_SwitchAnimation(proc->sprite2, 1);

    proc->index = index;
    proc->unk_2b = countMaybe;
    proc->flag = 0;

    return proc;
}

//! FE8U = 0x080C2B7C
void EndGmapRmBorder1(int index)
{
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        Proc_EndEach(ProcScr_GmapRmBorder1);
        return;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);
    do
    {
        proc = Proc_FindNext(&procIter);

        if (proc->index == index)
        {
            Proc_End(proc);
            return;
        }
    } while (proc != NULL);

    return;
}
