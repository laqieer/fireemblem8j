#include "global.h"
#include "hardware.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrbattle.h"

extern struct ProcCmd gProc_ekrTogiColor[];
extern const u16 Frames_ekrTogiColor[];
extern u16 *PalArray_ArenaBattleBg[];

void NewEkrTogiColor(void)
{
    gpProcEkrTogiColor = Proc_Start(gProc_ekrTogiColor, PROC_TREE_3);

    gpProcEkrTogiColor->timer = 0;

    gpProcEkrTogiColor->frame = 0;
    gpProcEkrTogiColor->frame_config = Frames_ekrTogiColor;
    gpProcEkrTogiColor->pal = PalArray_ArenaBattleBg;

    return;
}
