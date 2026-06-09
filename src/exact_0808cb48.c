#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"







/* prototypes for same-file helpers called by this run */
void InitBoxDialogue(void * vram_dst, int pad_idx);
void DrawBoxDialogueText(int x, int y, int msg);

void SetBoxDialogueSize(struct HelpBoxProc * proc, int w, int h) {
    w &= 0xF8;

    proc->wBoxFinal = w;
    proc->hBoxFinal = h;

    return;
}

//! FE8U = 0x0808A848
void BoxDialogue_OnInit(struct ProcBoxDialogue* proc) {
    if (proc->pad_idx == (u8)-1) {
        InitBoxDialogue(0, -1);
    } else {
        InitBoxDialogue(proc->unk_3c, proc->pad_idx);
    }

    DrawBoxDialogueText(proc->x, proc->y, proc->msg);

    return;
}
