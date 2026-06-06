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

static struct Vec2 EWRAM_DATA sSelectTargetRoot = {};

static struct SelectTarget EWRAM_DATA sSelectTargetList[MAX_TARGET_LIST_COUNT] = {0};

static int EWRAM_DATA sSelectTargetCount = 0;



struct Unk_085B658C
{
    s8 x, y;
};

struct Unk_085B658C CONST_DATA gNearTargetLinkOrder[] =
{
    {  0,  0 },
    {  0, -2 },
    {  0, -1 },
    { +1, -1 },
    { +1,  0 },
    { +2,  0 },
    { +1, +1 },
    {  0, +1 },
    {  0, +2 },
    { -1, +1 },
    { -1,  0 },
    { -2,  0 },
    { -1, -1 },
};

struct SelectTarget* GetLinkedTargetsNear(void) {
    int i, j;

    struct SelectTarget * first = NULL;
    struct SelectTarget * last = NULL;

    for (i = 0; i < (int) ARRAY_COUNT(gNearTargetLinkOrder); i++)
    {
        struct SelectTarget * it;

        int x = sSelectTargetRoot.x + gNearTargetLinkOrder[i].x;
        int y = sSelectTargetRoot.y + gNearTargetLinkOrder[i].y;

        for (j = 0, it = sSelectTargetList; j < sSelectTargetCount; j++, it++)
        {
            if (x == it->x && y == it->y)
            {
                it->next = last;

                if (last != NULL)
                    last->prev = it;

                if (first == NULL)
                    first = it;

                last = it;
            }
        }
    }

    first->next = last;
    last->prev = first;

    return first;
}

struct SelectTarget* GetLinkedTargetsFar(void) {
    LinkTargets();
    return sSelectTargetList;
}

struct SelectTarget* GetLinkedTargets(void) {
    if (GetFurthestTargetDistance() > 2) {
        return GetLinkedTargetsFar();
    }
    return GetLinkedTargetsNear();
}

inline int GetSelectTargetCount(void)
{
    return sSelectTargetCount;
}

inline struct SelectTarget* GetTarget(int index)
{
    return &sSelectTargetList[index];
}
