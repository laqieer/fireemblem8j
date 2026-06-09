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









struct Unk_085B658C
{
    s8 x, y;
};



void TargetSelection_GetRealCursorPosition(struct SelectTargetProc* proc, int* xPos, int* yPos) {
    *xPos = proc->currentTarget->x * 16;
    *yPos = proc->currentTarget->y * 16;
}
