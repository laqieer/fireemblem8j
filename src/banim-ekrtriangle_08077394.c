#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

extern EWRAM_OVERLAY(banim) int gEkrTriangleInvalid;

void NewEkrTriangle(struct Anim * anim)
{
    struct ProcEkrTriangle *proc;
    proc = Proc_Start(ProcScr_ekrTriangle, PROC_TREE_3);
    proc->anim = anim;
    gEkrTriangleInvalid = false;
}
