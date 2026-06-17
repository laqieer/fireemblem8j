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



extern int  gHelpbox_2[];
u16 GetDialogueBoxConfig(void);
void BoxDialogue_StartFaceMouthMove(void);
void BoxDialogue_StopFaceMouthMove(void);
void BoxDialogue_ClearTextLines(struct ProcBoxDialogueDrawTextExt* proc);
void DialogBoxGetGlyphLen(const char* str, u8* xOut);

void BoxDialogueInterpreter_Main(struct ProcBoxDialogueDrawTextExt* proc) {
    int iVar5;
    int i;

    iVar5 = proc->unk_4e;

    if ((gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) && !(GetDialogueBoxConfig() & 8)) {
        iVar5 = 0x80;
    } else {
        proc->unk_4a--;

        if (proc->unk_4a > 0) {
            return;
        }

        proc->unk_4a = proc->unk_4c;
    }

    BoxDialogue_StartFaceMouthMove();

    SetTextFont(proc->unk_30);

    for (i = 0; i < iVar5; i++) {
        struct HelpBoxProc * r3;
        const char* r1;
        int r0;
        int a, b;

        switch (*proc->str) {
            case 0x18: // [Yes]
                BoxDialogue_StopFaceMouthMove();

                r3 = Proc_Find(ProcScr_MergeBoxDialogue);

                StartYesNoChoice(gHelpbox_2, proc->texts[proc->current_line], r3->xBoxFinal, r3->yBoxFinal + proc->current_line * 16, 6, 1, proc);

                proc->str++;
                goto _0808B772;

            case 0x19: // [No]
                BoxDialogue_StopFaceMouthMove();

                r3 = Proc_Find(ProcScr_MergeBoxDialogue);

                StartYesNoChoice(gHelpbox_2, proc->texts[proc->current_line], r3->xBoxFinal, r3->yBoxFinal + proc->current_line * 16, 6, 2, proc);

                proc->str++;
                goto _0808B772;

            case 0x80:
                r1 = proc->str + 1;
                proc->str = r1;

                if (*r1 == 0x21) { // [ToggleRed]
                    r0 = proc->unk_59;
                    proc->unk_59 = (r0+1) & 1;
                    proc->str++;
                    i--;

                    continue;
                } else if (*r1 == 0x04) { // [LoadOverworldFaces]
                    BoxDialogue_StopFaceMouthMove();

                    Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 1);
                    Proc_Goto(proc, 1);

                    Proc_EndEach(ProcScr_TalkBoxIdle);
                    proc->str++;

                    goto _0808B772;

                } else if (*r1 == 0x25) { // [ToggleColorInvert]
                    proc->str++;

                    goto _0808B772;
                }

                // fallthrough

            case 0x12: // [NormalPrint] fe6 only?
            case 0x13: // [FastPrint] fe6 only?
            case 0x14: // [CloseSpeechFast]
            {
                struct HelpBoxProc * r4 = Proc_Find(ProcScr_MergeBoxDialogue);

                BoxDialogue_StopFaceMouthMove();

                proc->str++;
                if (*proc->str == 0x01) {
                    proc->str++;
                }

                if (r4 != 0) {
                    BoxDialogue_ClearTextLines(proc);
                    GetBoxDialogueSize(proc->str, &a, &b);

                    proc->unk_56 = a;
                    proc->unk_57 = b;

                    proc->unk_54 = r4->wBoxFinal;
                    proc->unk_55 = r4->hBoxFinal;
                    proc->timer = 0;

                    Proc_Goto(proc, 6);
                }

                goto _0808B772;
            }
            case 0x00: // [X]
                BoxDialogue_StopFaceMouthMove();

                if ((GetDialogueBoxConfig() & 2) == 0) {
                    Proc_Break(proc);
                    goto _0808B772;
                }

                Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 1);
                Proc_Goto(proc, 1);

                Proc_EndEach(ProcScr_TalkBoxIdle);

                goto _0808B772;

            case 0x01: // [NL]
                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                if (proc->unk_55 == (proc->current_line + 1)) {
                    // b _0808B1DE
                    proc->timer = 0;
                    Proc_Goto(proc, 4);

                    goto _0808B772;
                }

                proc->current_line++;

                continue;

            case 0x04: // [....]
                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                proc->unk_4a = 8;

                goto _0808B772;

            case 0x05: // [.....]
                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                proc->unk_4a = 0x10;

                goto _0808B772;

            case 0x06: // [......]
                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                proc->unk_4a = 0x20;

                goto _0808B772;

            case 0x07: // [.......]
                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                proc->unk_4a = 0x40;

                goto _0808B772;

            case 0x02: // [NL2]
                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                if (*proc->str == 0x01) { // [NL]
                    proc->str++;
                }

                if (*proc->str == 0x00) { // [X]
                    if ((GetDialogueBoxConfig() & 2) == 0) {
                        Proc_Break(proc);
                    } else {
                        Proc_Goto(Proc_Find(gProcScr_BoxDialogue), 1);
                        Proc_Goto(proc, 1);
                        Proc_EndEach(ProcScr_TalkBoxIdle);
                    }
                } else {
                    if ((GetDialogueBoxConfig() & 0x10) != 0) {
                        BoxDialogue_ClearTextLines(proc);
                    } else {
                        if (*proc->str != 0) {
                            proc->timer = 0;
                            Proc_Goto(proc, 5);
                        }
                    }
                }

                goto _0808B772;

            case 0x03: { // [A]
                int x;
                int y;
                struct HelpBoxProc * r0;

                BoxDialogue_StopFaceMouthMove();

                proc->str++;

                r0 = Proc_Find(ProcScr_MergeBoxDialogue);

                x = r0->xBoxFinal + proc->x_offset;
                y = r0->yBoxFinal + proc->current_line * 16;
                StartTalkWaitForInput(proc, x, y + 8);

                DialogBoxGetGlyphLen(proc->str, &proc->x_offset);

                goto _0808B772;
            }
        _0808B76A:
            continue;
        }

        if (GetDialogueBoxConfig() & 1) {
            Text_SetColor(proc->texts[proc->current_line], 1);
        } else {
            if (proc->unk_59 != 0) {
                Text_SetColor(proc->texts[proc->current_line], 10);
            } else {
                Text_SetColor(proc->texts[proc->current_line], 6);
            }
        }

        proc->str = Text_DrawCharacter(proc->texts[proc->current_line], proc->str);

        if (GetTextDisplaySpeed() != 1 || (GetGameClock() & 1) != 0) {

            if (GetDialogueBoxConfig() & 0x10) {
                PlaySoundEffect(SONG_2E5);
            } else {
                PlaySoundEffect(SONG_6E);
            }
        }
    }
_0808B772:
    SetTextFont(0);

    return;
}
