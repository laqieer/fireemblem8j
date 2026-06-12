extern int GenerateRandomonsterMergeConf();
#include "global.h"
#include "proc.h"
#include "worldmap.h"
#include "rng.h"
#include "ap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "soundwrapper.h"
#include "constants/worldmap.h"
#include "constants/chapters.h"
#include "constants/songs.h"

void GmapTimeMons_Init(struct ProcGmapTimeMons * proc)
{
    int ret;
    proc->trigger = false;
    ret = GenerateRandomonsterMergeConf(GetNextUnclearedChapter(), proc->confs);
    proc->monster_amt = ret;

    if (!(u8)ret)
        Proc_Goto(proc, 0);
}
