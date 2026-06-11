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

//! FE8U = 0x08089E58
void HelpBoxTextScroll_OnLoop(struct HelpBoxScrollProc * proc)
{
    int i;

    proc->step--;

    if (proc->step > 0) {
        return;
    }

    proc->step = proc->speed;

    SetTextFont(proc->font);

    for (i = 0; i < proc->chars_per_step; i++) {

        switch (*proc->string) {
        case CHFE_L_X:
            Proc_Break(proc);
            goto _08089EE0;

        case CHFE_L_NL:
            proc->string++;
            proc->pretext_lines++;
            continue;


        case CHFE_L_Pause8:
            proc->string++;
            continue;

        default:
            proc->string = Text_DrawCharacter(proc->texts[proc->pretext_lines], proc->string);
            continue;
        }

    }

_08089EE0:
    SetTextFont(0);
}

//! FE8U = 0x08089EEC
void HelpBoxDrawOneLineExt(struct HelpBoxScrollProc * proc) {
    int i;

    SetTextFont(proc->font);

    for (i = 0; i < 6; i++) {
        struct Text* th;
_08089EF8:
        th = proc->texts[i];

        Text_SetCursor(th, GetStringTextCenteredPos(th->tile_width * 8, proc->string));

        while (1) {
            switch (*proc->string) {
            case CHFE_L_X:
                goto _08089F4C;

            case CHFE_L_NL:
                proc->string++;

                i++;
                if (i < 6) {
                    goto _08089EF8;
                } else {
                    goto _08089F4C;
                }

            case CHFE_L_Pause16:
            case CHFE_L_Pause8:
                proc->string++;

                continue;

            default:
                proc->string = Text_DrawCharacter(th, proc->string);
                continue;
            }
        }
    }

_08089F4C:
    SetTextFont(proc->font);
}
