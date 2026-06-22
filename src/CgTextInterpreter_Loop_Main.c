#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "scene.h"
#include "face.h"
#include "soundwrapper.h"
#include "cgtext.h"
#include "functions.h"
#include "variables.h"
#include "constants/songs.h"

extern int gTextIds_AskExit[];
extern int gTextIds_YesNo[];

//! FE8J = 0x08091B88
void CgTextInterpreter_Loop_Main(struct CgTextInterpreterProc * proc)
{
    u16 faceDisp;
    int i;

    struct CgTextMainProc * parent = proc->proc_parent;

    int numCharsVisible = parent->numCharsVisible;

    if ((gKeyStatusPtr->newKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) && !(GetCgTextFlags() & CG_TEXT_FLAG_5))
    {
        numCharsVisible = INT8_MAX;
    }
    else
    {
        parent->pauseTimer--;

        if (parent->pauseTimer > 0)
        {
            return;
        }

        parent->pauseTimer = parent->displaySpeed;
    }

    SetTextFont(parent->pFont);

    switch ((u8)gUnk_80)
    {
        case 0:
            faceDisp = GetFaceDisplayBitsById(0) | FACE_DISP_TALK_1;
            SetFaceBlinkControlById(0, 3);
            SetFaceBlinkControlById(1, 1);
            break;

        case 1:
            faceDisp = GetFaceDisplayBitsById(1) | FACE_DISP_TALK_1;
            SetFaceBlinkControlById(1, 3);
            SetFaceBlinkControlById(0, 1);
            break;

        default:
            faceDisp = GetFaceDisplayBitsById(0) | FACE_DISP_TALK_1;
            SetFaceBlinkControlById(0, 3);
            SetFaceBlinkControlById(1, 1);
            break;
    }

    for (i = 0; i < numCharsVisible; i++)
    {
        switch (*parent->str)
        {
            case 0x18: /* [Yes] */
                parent->thIndex++;

                StartYesNoChoice(
                    (GetCgTextFlags() & CG_TEXT_FLAG_9)
                        ? gTextIds_AskExit
                        : gTextIds_YesNo,
                    parent->pTexts[parent->thIndex],
                    parent->x * 8,
                    (parent->thIndex * 2 + parent->y) * 8,
                    0xb,
                    TALK_CHOICE_YES,
                    proc);

                parent->str++;
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x19: /* [No] */
                parent->thIndex++;

                StartYesNoChoice(
                    (GetCgTextFlags() & CG_TEXT_FLAG_9)
                        ? gTextIds_AskExit
                        : gTextIds_YesNo,
                    parent->pTexts[parent->thIndex],
                    parent->x * 8,
                    (parent->thIndex * 2 + parent->y) * 8,
                    0xb,
                    TALK_CHOICE_NO,
                    proc);

                parent->str++;
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x00: /* [X] */
                if (GetCgTextFlags() & CG_TEXT_FLAG_2)
                {
                    ClearCgTextFlag(CG_TEXT_FLAG_2);
                    Proc_Goto(parent, 4);
                }
                else
                {
                    Proc_Goto(parent, 0);
                }

                Proc_Goto(proc, 99);
                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x01: /* [NL] */
                parent->str++;

                if (parent->thIndex + 1 >= parent->boxHeight / 2)
                {
                    parent->unk_5f = 1;
                    Proc_Goto(proc, 1);

                    goto _0808FE68;
                }

                parent->thIndex++;

                continue;

            case 0x04: /* [...] */
                parent->pauseTimer = 8;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x05: /* [....] */
                parent->pauseTimer = 16;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x06: /* [.....] */
                parent->pauseTimer = 32;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x07: /* [......] */
                parent->pauseTimer = 128;
                parent->str++;

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x16: /* [ToggleMouthMove] */
                parent->str++;

                faceDisp &= ~FACE_DISP_SMILE;

                continue;

            case 0x17: /* [ToggleSmile] */
                parent->str++;

                faceDisp |= FACE_DISP_SMILE;

                continue;

            case 0x02: /* [2NL] */
                parent->str++;

                if (*parent->str == 0x01) /* [NL] */
                {
                    parent->str++;
                }

                if (GetCgTextFlags() & CG_TEXT_FLAG_3)
                {
                    Proc_Goto(proc, 2);
                }
                else
                {
                    parent->unk_5f = parent->thIndex + 1;
                    Proc_Goto(proc, 1);
                }

                faceDisp &= ~FACE_DISP_TALK_1;

                goto _0808FE68;

            case 0x03: /* [A] */
                faceDisp &= ~FACE_DISP_TALK_1;
                parent->str++;

                if (GetCgTextFlags() & CG_TEXT_FLAG_8)
                {
                    StartTalkWaitForInputUnk(
                        proc, parent->x * 8 + parent->textWidth + 4, parent->y * 8 + parent->textHeight + 8, 0x400);
                }
                else
                {
                    StartTalkWaitForInput(
                        proc, parent->x * 8 + parent->textWidth + 4, parent->y * 8 + parent->textHeight + 8);
                }

                GetCgTextDimensions(parent->str, &parent->textWidth, &parent->textHeight);

                goto _0808FE68;

            case 0x80:
                parent->str++;

                if (*parent->str == 0x21) /* [ToggleRed] */
                {
                    parent->unk_5e = 1 - parent->unk_5e;
                }

                parent->str++;

                continue;
        }

        if (parent->unk_5e != 0)
        {
            Text_SetColor(parent->pTexts[parent->thIndex], 0xc);
        }
        else
        {
            Text_SetColor(parent->pTexts[parent->thIndex], 0xb);
        }

        parent->str = Text_DrawCharacter(parent->pTexts[parent->thIndex], parent->str);

        if (GetTextDisplaySpeed() != 1 || (GetGameClock() & 1))
        {
            if (!(GetCgTextFlags() & CG_TEXT_FLAG_4))
            {
                PlaySoundEffect(SONG_6E);
            }
        }
    }

_0808FE68:
    SetTextFont(NULL);

    switch ((u8)gUnk_80)
    {
        case 0:
            SetFaceDisplayBitsById(0, faceDisp);
            break;

        case 1:
            SetFaceDisplayBitsById(1, faceDisp);
            break;

        default:
            SetFaceDisplayBitsById(0, faceDisp);
            break;
    }

    return;
}
