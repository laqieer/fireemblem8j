#include "global.h"

#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"

#include "bmguide.h"
#include "constants/songs.h"

/* TU-private data externs bound at their JP addresses */
extern struct GuideSt * gGuideSt;
extern struct ProcCmd gProcScr_GuideEntryListRedraw_Initial[];
extern struct ProcCmd gProcScr_GuideCategoryRedraw[];
extern struct ProcCmd gProcScr_GuideDetailsRedraw[];

/* callees */
int GetGuideAction(ProcPtr proc);
void SetGuidePanelTilemapPalette(u16 off);
void MoveGuideDetailText(int idx, int moveDirection);
void GuideList_ScrollUp(ProcPtr proc, int b);
void GuideList_ScrollDown(ProcPtr proc, int b);
void LockMenuScrollBar(void);
void UnlockMenuScrollBar(void);

//! FE8U = 0x080CEE34
void Guide_MainLoop(struct GuideProc * proc)
{
    register struct GuideProc * proc_ asm("r5") = proc;
    register int flag asm("r4") = 0;

    switch (GetGuideAction(proc))
    {
        case GUIDE_ACTION_A_PRESS:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            gGuideSt->state++;

            switch (gGuideSt->state)
            {
                case GUIDE_STATE_1:
                    SetGuidePanelTilemapPalette(0x2000);
                    BG_EnableSyncByMask(BG2_SYNC_BIT);

                    break;

                case GUIDE_STATE_2:
                    gGuideSt->detailLinesScrolled = 0;
                    SetFlag(gGuideTable[gGuideSt->unk_68[gGuideSt->unk_2b]].readFlag);
                    MoveGuideDetailText(gGuideSt->unk_68[gGuideSt->unk_2b], GUIDE_DETAILS_STAY);
                    LockMenuScrollBar();

                    return;

                default:
                    return;
            }

            break;

        case GUIDE_ACTION_ADVANCE_TEXT:
            MoveGuideDetailText(gGuideSt->unk_68[gGuideSt->unk_2b], GUIDE_DETAILS_ADVANCE);
            break;

        case GUIDE_ACTION_REVERSE_TEXT:
            MoveGuideDetailText(gGuideSt->unk_68[gGuideSt->unk_2b], GUIDE_DETAILS_REVERSE);
            break;

        case GUIDE_ACTION_CANCEL:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

            if (gGuideSt->state != GUIDE_STATE_0)
            {
                gGuideSt->state--;

                switch (gGuideSt->state)
                {
                    case GUIDE_STATE_0:
                        SetGuidePanelTilemapPalette(0x1000);
                        BG_EnableSyncByMask(BG2_SYNC_BIT);
                        break;

                    case GUIDE_STATE_1:
                        Proc_StartBlocking(gProcScr_GuideEntryListRedraw_Initial, proc_);
                        UnlockMenuScrollBar();
                        return;

                    default:
                        return;
                }
            }
            else
            {
                Proc_Break(proc_);
                return;
            }

            break;

        case GUIDE_ACTION_SORT:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            gGuideSt->sortMode = (gGuideSt->sortMode + 1) & 1;
            if (gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC)
            {
                SetFlag(0xb3);
            }
            else
            {
                ClearFlag(0xb3);
            }

            gGuideSt->categoryIdx = 0;
            gGuideSt->unk_2a = 0;
            gGuideSt->unk_2b = 0;
            gGuideSt->unk_2c = 0;

            Proc_StartBlocking(gProcScr_GuideCategoryRedraw, proc_);

            break;

        case GUIDE_ACTION_1:
            switch (gGuideSt->state)
            {
                case GUIDE_STATE_0:
                    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
                    {
                        if (gGuideSt->categoryIdx != 0)
                        {
                            gGuideSt->categoryIdx--;

                            if (((gGuideSt->categoryIdx - gGuideSt->unk_2a) < 1) && (gGuideSt->unk_2a != 0))
                            {
                                gGuideSt->unk_2a--;
                                GuideList_ScrollUp(proc_, gGuideSt->categoryIdx - 1);
                            }

                            flag = 1;
                        }
                    }
                    else
                    {
                        if (gGuideSt->categoryIdx <
                            ((gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC ?
                                gGuideSt->unk_3c : gGuideSt->unk_3d) - 1))
                        {
                            gGuideSt->categoryIdx++;

                            if ((gGuideSt->categoryIdx - gGuideSt->unk_2a) > 4)
                            {
                                if (gGuideSt->categoryIdx <
                                    ((gGuideSt->sortMode != GUIDE_SORT_MODE_TOPIC
                                        ? gGuideSt->unk_3c : gGuideSt->unk_3d) - 1))
                                {
                                    gGuideSt->unk_2a++;
                                    GuideList_ScrollDown(proc_, gGuideSt->categoryIdx + 1);
                                }
                            }
                            flag = 1;
                        }
                    }

                    if (flag == 1)
                    {
                        Proc_Start(gProcScr_GuideEntryListRedraw_Initial, proc_);
                        gGuideSt->unk_2b = 0;
                        gGuideSt->unk_2c = 0;
                    }

                    goto skip_flag;

                case GUIDE_STATE_1:
                    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
                    {
                        if (gGuideSt->unk_2b == 0)
                        {
                            goto skip_flag;
                        }

                        gGuideSt->unk_2b--;

                        if ((gGuideSt->unk_2b - gGuideSt->unk_2c < 1) && (gGuideSt->unk_2c != 0))
                        {
                            gGuideSt->unk_2c--;
                            GuideList_ScrollUp(proc_, gGuideSt->unk_2b - 1);
                        }

                        goto set_flag;
                    }
                    else
                    {
                        if (gGuideSt->unk_2b >= (gGuideSt->unk_3e - 1))
                        {
                            goto skip_flag;
                        }

                        gGuideSt->unk_2b++;

                        if ((gGuideSt->unk_2b - gGuideSt->unk_2c > 4) && (gGuideSt->unk_2b < gGuideSt->unk_3e - 1))
                        {
                            gGuideSt->unk_2c++;
                            GuideList_ScrollDown(proc_, gGuideSt->unk_2b + 1);
                        }

                        goto set_flag;
                    }

                case GUIDE_STATE_2:
                    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
                    {
                        if (gGuideSt->detailLinesScrolled == 0)
                        {
                            goto skip_flag;
                        }

                        {
                            s8 t = gGuideSt->detailLinesScrolled - 1;
                            flag = 0;
                            gGuideSt->detailLinesScrolled = t;
                        }
                        proc_ = Proc_StartBlocking(gProcScr_GuideDetailsRedraw, proc_);
                        proc_->unk_34 = gGuideSt->detailLinesScrolled;
                        proc_->unk_38 = flag;
                        goto set_flag;
                    }
                    else
                    {
                        if (gGuideSt->detailLinesScrolled >= gGuideSt->numDetailLines - 4)
                        {
                            goto skip_flag;
                        }

                        gGuideSt->detailLinesScrolled++;

                        proc_ = Proc_StartBlocking(gProcScr_GuideDetailsRedraw, proc_);
                        proc_->unk_34 = gGuideSt->detailLinesScrolled + 3;
                        proc_->unk_38 = 1;
                        goto set_flag;
                    }
            }

            goto skip_flag;

        set_flag:
            flag = 1;

        skip_flag:
            if (flag == 1)
            {
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            }
    }

    return;
}
