#include "common.h"

struct SelectTarget {
    u8 x;
    u8 y;
    u8 uid;
    u8 extra;
    u8 pad[8];
};

struct State {
    struct SelectTarget sSelectTargetList[4];
    int sSelectTargetCount;
};

static void us_AddTarget(struct State *s, int x, int y, int unitId, int tId)
{
    s->sSelectTargetList[s->sSelectTargetCount].x = x;
    s->sSelectTargetList[s->sSelectTargetCount].y = y;
    s->sSelectTargetList[s->sSelectTargetCount].uid = unitId;
    s->sSelectTargetList[s->sSelectTargetCount].extra = tId;
    s->sSelectTargetCount++;
}

static void jp_AddTarget(struct State *s, int x, int y, int unitId, int tId)
{
    s->sSelectTargetList[s->sSelectTargetCount].x = x;
    s->sSelectTargetList[s->sSelectTargetCount].y = y;
    s->sSelectTargetList[s->sSelectTargetCount].uid = unitId;
    s->sSelectTargetList[s->sSelectTargetCount].extra = tId;
    s->sSelectTargetCount++;
}

static void init(struct State *us, struct State *jp)
{
    unsigned i, j;
    us->sSelectTargetCount = jp->sSelectTargetCount = nondet_int();
    ASSUME(us->sSelectTargetCount >= 0 && us->sSelectTargetCount < 4);

    for (i = 0; i < 4; i++) {
        us->sSelectTargetList[i].x = jp->sSelectTargetList[i].x = nondet_uchar();
        us->sSelectTargetList[i].y = jp->sSelectTargetList[i].y = nondet_uchar();
        us->sSelectTargetList[i].uid = jp->sSelectTargetList[i].uid = nondet_uchar();
        us->sSelectTargetList[i].extra = jp->sSelectTargetList[i].extra = nondet_uchar();
        for (j = 0; j < 8; j++)
            us->sSelectTargetList[i].pad[j] = jp->sSelectTargetList[i].pad[j] = nondet_uchar();
    }
}

int main(void)
{
    struct State us, jp;
    unsigned i, j;
    int x = nondet_int();
    int y = nondet_int();
    int unitId = nondet_int();
    int tId = nondet_int();

    ASSUME(x >= 0 && x <= 255);
    ASSUME(y >= 0 && y <= 255);
    ASSUME(unitId >= 0 && unitId <= 255);
    ASSUME(tId >= 0 && tId <= 255);

    init(&us, &jp);
    us_AddTarget(&us, x, y, unitId, tId);
    jp_AddTarget(&jp, x, y, unitId, tId);

    ASSERT(us.sSelectTargetCount == jp.sSelectTargetCount, "AddTarget count");
    for (i = 0; i < 4; i++) {
        ASSERT(us.sSelectTargetList[i].x == jp.sSelectTargetList[i].x, "AddTarget x");
        ASSERT(us.sSelectTargetList[i].y == jp.sSelectTargetList[i].y, "AddTarget y");
        ASSERT(us.sSelectTargetList[i].uid == jp.sSelectTargetList[i].uid, "AddTarget uid");
        ASSERT(us.sSelectTargetList[i].extra == jp.sSelectTargetList[i].extra, "AddTarget extra");
        for (j = 0; j < 8; j++)
            ASSERT(us.sSelectTargetList[i].pad[j] == jp.sSelectTargetList[i].pad[j],
                   "AddTarget untouched padding");
    }
    return 0;
}
