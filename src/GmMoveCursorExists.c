#include "global.h"
#include "spline.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmMoveCursor[];

s8 GmMoveCursorExists(void)
{
    return Proc_Exists(ProcScr_GmMoveCursor);
}
