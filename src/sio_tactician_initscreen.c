#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"

int StrLen(u8 * str_buf);

//! FE8U = 0x0804470C
void Tactician_InitScreen(struct ProcTactician * proc)
{
    int i;
    char * str;
    u8 str_buf[0x10];
    const struct TacticianTextConf * conf;

    ClearSioBG();
    InitSioBG();
    StartMuralBackgroundExt(proc, 0, 0, 0, 0);
    Decompress(Img_TacticianSelObj, (void *)0x06014800);
    ApplyPalette(Pal_TacticianSelObj, 0x13);
    ApplyPalette(Pal_UnkData_0, 0x14);
    CallARM_FillTileRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 0, 8), Tsa_UnkData_0, 0x1000);
    SetTextFont(&Font_0);
    InitSystemTextFont();
    ResetTextFont();

    if (CheckInLinkArena())
    {
        proc->max_len = 7;
    }
    else
    {
        gLinkArenaSt.unk_00 = 0;
        proc->max_len = 5;
    }

    for (i = 0; i < (proc->max_len * 2 + 1); i++)
        proc->str[i] = '\0';

    for (i = 0; i < proc->max_len; i++)
        proc->unk4C[i] = 0;

    proc->cur_len = 0;
    InitText(&Text_0, 8);
    proc->line_idx = 1;
    proc->conf_idx = 6;

    conf = GetTacticianTextConf(6);
    proc->child1 = StartNameEntrySpriteDraw(proc, conf->x - 4, conf->y + 1);
    proc->unk39 = 0;

    for (i = 0; i < 10; i++)
        InitText(Texts_1 + i, 0x1A);

    InitText(&Texts_0, 0xC);
    StartLinkArenaTitleBanner(proc->child1, 3, 0x500);
    SetLinkArenaUiBlendAndWindowOff();
    gUnk_Sio_12 = 0;
    proc->text_idx = 0;
    Tactician_DrawCharGrid(proc);

    if (proc->unk32 != 0)
    {
        register int i asm("r5");
        register int j asm("r4");
        register int cl asm("r0");
        register int char_cnt asm("r1");

        i = 0;
        str = GetTacticianName();
        while (*str != '\0')
        {
            j = 1;
            do
            {
                proc->str[i] = *str;
                str_buf[i] = *str;
                str++;
                i++;
            } while (--j >= 0);

            cl = proc->cur_len;
            char_cnt = cl + 2;
            if (char_cnt <= proc->unk33 * 2)
                proc->cur_len = char_cnt;
        }
        Tactician_MapNameToConfIndices(proc, str_buf);
        TacticianDrawCharacters(proc);
        str_buf[proc->unk33 * 2 - 2] = '\0';
        proc->child1->unk40 = StrLen(str_buf) * 9;
    }
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}
