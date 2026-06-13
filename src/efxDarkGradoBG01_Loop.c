#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

//! FE8U = 0x08069100
void efxDarkGradoBG01_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    switch (proc->frame)
    {
        case 1:
            switch (proc->timer)
            {
                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_10);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_13);
                    break;
            }

            break;

        case 2:
            switch (proc->timer)
            {
                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_7);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_8);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_10);
                    break;
            }

            break;

        case 3:
            switch (proc->timer)
            {
                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_6);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_8);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_6);
                    break;
            }

            break;

        case 4:
            switch (proc->timer)
            {
                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_4);
                    break;

                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_5);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_4);
                    break;
            }

            break;

        case 5:
            switch (proc->timer)
            {
                case 3:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_3);
                    break;

                case 2:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
                    break;

                case 1:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_3);
                    break;

                case 0:
                    SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_2);
                    break;
            }

            break;

        default:
            SetPrimaryHBlankHandler(efxDarkGradoBG01_OnHBlank_0);
            break;
    }

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        proc->terminator = ret;
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            SetPrimaryHBlankHandler(NULL);
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}
