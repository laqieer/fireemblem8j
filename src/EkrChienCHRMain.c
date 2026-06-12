#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "banim_data.h"
#include "constants/classes.h"

void EkrChienCHRMain(struct ProcEkrChienCHR * proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}
