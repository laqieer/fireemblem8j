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

extern struct Unk_085B658C CONST_DATA gNearTargetLinkOrder[];

/* prototypes for same-file helpers called by this run */
void TargetSelection_GetRealCursorPosition(struct SelectTargetProc* proc, int* xPos, int* yPos);
ProcPtr EndTargetSelection(struct SelectTargetProc* proc);
void TargetSelection_HandleMoveInput(struct SelectTargetProc* proc);
int TargetSelection_HandleSelectInput(struct SelectTargetProc* proc);

void TargetSelection_Loop(struct SelectTargetProc* proc) {
    int x, y;
    int r5;

    if ((TARGETSELECTION_FLAG_FROZEN & proc->flags) != 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        PutMapCursor(x, y, 4);
        return;
    }

    TargetSelection_HandleMoveInput(proc);

    r5 = TargetSelection_HandleSelectInput(proc);

    if ((TARGETSELECTION_ACTION_END & r5) != 0) {
        EndTargetSelection(proc);
    }

    if ((TARGETSELECTION_ACTION_SE_6A & r5) != 0) {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
    }

    if ((TARGETSELECTION_ACTION_SE_6B & r5) != 0) {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    }

    if ((TARGETSELECTION_ACTION_CLEARBGS & r5) != 0) {
        ClearBg0Bg1();
    }

    if ((TARGETSELECTION_ACTION_ENDFACE & r5) != 0) {
        EndFaceById(0);
    }

    if ((TARGETSELECTION_ACTION_ENDFAST & r5) == 0) {
        TargetSelection_GetRealCursorPosition(proc, &x, &y);
        if (EnsureCameraOntoPosition(proc, x >> 4, y >> 4) != 1) {
            PutMapCursor(x, y, 2);
        }
    }

    return;
}
