typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed char s8;
typedef signed short s16;

struct Unit { u8 _pad[0xC]; u32 state; s8 xPos; s8 yPos; };
struct REDA;

struct EventEngineProc
{
    u8 _pad[0x38];
    /* 38 */ const u16* pEventCurrent;
    /* 3C */ u16 evStateBits;
};

extern struct Unit* GetUnitStructFromEventParameter(s16 pid);   /* sub_800BF3C */
extern unsigned ModifyMoveUnitFlag(struct EventEngineProc*, s8); /* sub_800FE54 */
extern u8 TryPrepareEventUnitMovement(struct EventEngineProc* proc, int x, int y); /* sub_800FE0C */
extern void BmMapFill(u8** map, int value);                     /* sub_80194BC */
extern void MoveUnit_(struct Unit*, s8, s8, u16);               /* sub_807C40C */
extern void MuCtr_StartMoveTowards(struct Unit*, s8, s8, u8, u16); /* sub_807C1DC */
extern void MuCtr_StartDefinedMove(struct Unit* unit, const struct REDA* redas, s16 count, u16 flags); /* sub_807C178 */

extern u8** gBmMapOther;        /* 0x0202E4EC */
extern u32 gEventSlots[];       /* 0x030004B0 */
extern u32 gEventSlotQueue[];   /* 0x030004E8 */

u8 sub_800FF08(struct EventEngineProc* proc)
{
    int dir;
    int flag;
    s16 facing;
    struct Unit* unit;
    s8 xOrig;
    s8 yOrig;
    s8 x;
    s8 y;
    const struct REDA* redas;
    u16 count;

    dir = proc->pEventCurrent[0] & 7;
    flag = (proc->pEventCurrent[0] & 0xf) >> 3;
    facing = proc->pEventCurrent[1];

    unit = GetUnitStructFromEventParameter(proc->pEventCurrent[2]);
    if (unit == 0)
        return 0;

    xOrig = unit->xPos;
    yOrig = unit->yPos;

    if (!(unit->state & 0x00400000) && (unit->state & 4))
        return 0;

    switch (dir)
    {
    case 0:
        x = (s8)proc->pEventCurrent[3];
        y = (s8)(proc->pEventCurrent[3] >> 8);
        redas = 0;
        break;
    case 1:
    {
        s16 pid = proc->pEventCurrent[3];
        struct Unit* u2;
        if (pid < 0)
            pid = 0;
        u2 = GetUnitStructFromEventParameter(pid);
        if (u2 == 0)
            return 6;
        x = u2->xPos;
        y = u2->yPos;
        redas = 0;
        break;
    }
    case 2:
        x = xOrig;
        y = yOrig;
        switch (proc->pEventCurrent[3])
        {
        case 0:
            x = x - 1;
            break;
        case 1:
            x = x + 1;
            break;
        case 2:
            y = y + 1;
            break;
        case 3:
            y = y - 1;
            break;
        }
        redas = 0;
        break;
    case 3:
        redas = (const struct REDA*)gEventSlotQueue;
        break;
    }

    count = ModifyMoveUnitFlag(proc, flag);

    BmMapFill(gBmMapOther, 0);

    if (((proc->evStateBits >> 2) & 1) || facing < 0)
    {
        MoveUnit_(unit, x, y, count);
        return 0;
    }

    if (!TryPrepareEventUnitMovement(proc, xOrig, yOrig))
        return 3;

    if (redas != 0)
    {
        MuCtr_StartDefinedMove(unit, redas, (s16)(gEventSlots[13] << 15 >> 16), count);
        return 0;
    }

    MuCtr_StartMoveTowards(unit, x, y, (u8)facing, count);
    return 0;
}