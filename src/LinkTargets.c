#include "global.h"
#include "functions.h"
#include "m4a.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "uiselecttarget.h"
#include "constants/songs.h"

extern struct Vec2 sSelectTargetRoot;
extern struct SelectTarget sSelectTargetList[];
extern int sSelectTargetCount;
extern inline int GetSelectTargetCount(void) { return sSelectTargetCount; }
extern inline struct SelectTarget* GetTarget(int index) { return &sSelectTargetList[index]; }

void LinkTargets(void)
{
    int i, last;

    for (i = 0; i < GetSelectTargetCount(); i++)
    {
        GetTarget(i)->prev = GetTarget(i - 1);
        GetTarget(i)->next = GetTarget(i + 1);
    }

    last = GetSelectTargetCount() - 1;

    GetTarget(0)->prev = GetTarget(last);
    GetTarget(last)->next = GetTarget(0);
}
