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



extern EWRAM_DATA struct HelpBoxInfo gTmpHelpBoxInfo;
extern EWRAM_DATA const struct HelpBoxInfo * gpHelpBoxCurrentInfo;

/* prototypes for same-file helpers called by this run */
void SetDialogueBoxConfig(u16 config);
void BoxDialogue_DrawBoxInterpolated(struct HelpBoxProc * proc, int interpolateMethod);
void ClearBoxDialogueText(void);

//! FE8U = 0x0808A9C0
void MergeBoxDialogue3(struct HelpBoxProc * proc) {

    BoxDialogue_DrawBoxInterpolated(proc, INTERPOLATE_LINEAR);

    proc->timer--;

    if (proc->timer < 0) {
        Proc_Break(proc);
        Proc_EndEach(ProcScr_TalkBoxIdle);
    }

    return;
}

//! FE8U = 0x0808A9F0
void EndBoxDialogueMerge(void) {
    ClearBoxDialogueText();

    Proc_BreakEach(ProcScr_MergeBoxDialogue);

    return;
}

//! FE8U = 0x0808AA04
void StartBoxDialogue(int x, int y, int msgId, ProcPtr parent) {
    struct ProcBoxDialogue* proc;

    Proc_EndEach(gProcScr_BoxDialogue);

    SetDialogueBoxConfig(0);

    if (!parent) {
        proc = Proc_Start(gProcScr_BoxDialogue, PROC_TREE_3);
    } else {
        proc = Proc_StartBlocking(gProcScr_BoxDialogue, parent);
    }

    proc->x = x;
    proc->y = y;
    proc->msg = msgId;
    proc->pad_idx = 0xff;
    proc->unk_38 = 1;

    Proc_Start(ProcScr_TalkBoxIdle, 0);

    return;
}

//! FE8U = 0x0808AA6C
void StartBoxDialogueExt(int x, int y, int msgId, u16* unkA, int unkB, ProcPtr parent) {
    struct ProcBoxDialogue* proc;

    Proc_EndEach(gProcScr_BoxDialogue);

    SetDialogueBoxConfig(0);

    if (!parent) {
        proc = Proc_Start(gProcScr_BoxDialogue, PROC_TREE_3);
    } else {
        proc = Proc_StartBlocking(gProcScr_BoxDialogue, parent);
    }

    proc->x = x;
    proc->y = y;
    proc->msg = msgId;
    proc->pad_idx = unkB;
    proc->unk_3c = unkA;
    proc->unk_38 = 1;

    Proc_Start(ProcScr_TalkBoxIdle, 0);

    return;
}

//! FE8U = 0x0808AADC
void GetBoxDialogueSize(const char* str, int* wOut, int* hOut) {
    int charWidth;

    int w = 0;
    int h = 16;

    *wOut = 0;
    *hOut = 0;

    while (1) {

        switch (*str) {
            case 0x12: // [NormalPrint] // FE6 only?
            case 0x13: // [FastPrint] // FE6 only?
            case 0x14: // [CloseSpeechFast]
                if (*wOut < w) {
                    *wOut = w;
                }

                if (*hOut < h) {
                    *hOut = h;
                }

                break;

            case 0x80: // control signal?
                str += 2;

                continue;

            case 0x01: // [NL]
                h += 16;

                if (*wOut < w) {
                    *wOut = w;
                }

                w = 0;

                str++;

                continue;

            case 0x18: // [Yes]
            case 0x19: // [No]
                w = 0;
                str++;

                continue;

            case 0x04: // [....]
            case 0x05: // [.....]
            case 0x06: // [......]
            case 0x07: // [.......]
                str++;

                continue;

            case 0x02: // [NL2]
                str++;

                if (*hOut < h) {
                    *hOut = h;
                }

                h = 0;

                if (*wOut < w) {
                    *wOut = w;
                }

                w = 0;

                continue;

            case 0x03: // [A]
                str++;

                if (*hOut < h) {
                    *hOut = h;
                }

                h = 0;

                if (*wOut < w + 8) {
                    *wOut = w + 8;
                }

                w = 0;

                continue;

            case 0x00: // [X]
                if (*wOut < w) {
                    *wOut = w;
                }

                if (*hOut < h) {
                    *hOut = h;
                }

                break;

            default:
                str = GetCharTextLen(str, &charWidth);
                w += charWidth;

                continue;
        }

        break;
    }

    return;
}

//! FE8U = 0x0808AB98
void DialogBoxGetGlyphLen(const char* str, u8* xOut) {
    int charWidth;
    u8 a;

    int x = 0;
    const char* it = str;

    *xOut = x;

    SetTextFontGlyphs(1);

    while (1) {
        switch (*it) {
            case 0x02: // [NL2]
            case 0x04: // [....]
            case 0x05: // [.....]
            case 0x06: // [......]
            case 0x07: // [.......]
            case 0x12: // [NormalPrint] // FE6 only?
            case 0x13: // [FastPrint] // FE6 only?
            case 0x14: // [CloseSpeechFast]
                it++;

                continue;

            case 0x01: // [NL]
            case 0x18: // [Yes]
            case 0x19: // [No]
                it++;
                x = 0;

                continue;

            case 0x80:
                it += 2;

                continue;


            default:
                it = GetCharTextLen(it, &charWidth);
                x += charWidth;

                continue;

            case 0x00: // [X]
            case 0x03: // [A]
                a = x + 2;
                *xOut = a;

                return;
        }
    }
}
