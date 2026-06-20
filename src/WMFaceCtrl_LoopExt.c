#include "global.h"
int GetWMFaceVramOffset(void);
void PutWMFaceOnBg(int bg, u32 offset, int xIn, int yIn, u8 flip);
int GetWMFaceBg(void);
#include "face.h"
#include "hardware.h"
#include "worldmap.h"

//! FE8U = 0x080B843C
void WMFaceCtrl_LoopExt(struct WMFaceCtrlProc * proc)
{
    int i;
    int iVar10;
    struct WMFaceHolderProc * internalProc = proc->faceHolderProc;
    int bg = GetWMFaceBg();

    for (i = 0; i < 2; i++)
    {
        iVar10 = 0;

        if (internalProc->faceWrapper[i].faceProc != NULL)
        {
            struct FaceProc * faceProc = internalProc->faceWrapper[i].faceProc;
            int x = internalProc->faceWrapper[i].x;
            u16 * yptrUnsigned = &internalProc->faceWrapper[i].y;

            if (((*yptrUnsigned & 0x800) != 0) && ((*yptrUnsigned & 0xff) < 0x10))
            {
                if ((*yptrUnsigned & 0x100) != 0)
                {
                    faceProc->xPos = x + (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                if ((*yptrUnsigned & 0x200) != 0)
                {
                    faceProc->xPos = x - (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                (*yptrUnsigned)++;

                if ((*yptrUnsigned & 0xff) > 0xf)
                {
                    iVar10 = 2;

                    SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) &~ 0x4000);
                    *yptrUnsigned &= ~0x800;
                }
            }

            if (((*yptrUnsigned & 0x1000) != 0) && ((*yptrUnsigned & 0xff) < 0x10))
            {
                if ((*yptrUnsigned & 0xff) == 0)
                    SetFaceDisplayBits(faceProc, GetFaceDisplayBits(faceProc) | 0x4000);

                if ((*yptrUnsigned & 0x100) != 0)
                {
                    faceProc->xPos = ({ x - 0x20; }) + (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                if ((*yptrUnsigned & 0x200) != 0)
                {
                    faceProc->xPos = ({ x + 0x20; }) - (((0x10 - (*yptrUnsigned & 0xff)) * 0x20 * (0x10 - (*yptrUnsigned & 0xff))) / 256);
                    iVar10 = 1;
                }

                (*yptrUnsigned)++;

                if ((*yptrUnsigned & 0xff) > 0xf)
                    iVar10 = 2;
            }

            switch (iVar10) {
            case 1:
                BG_Fill(BG_GetMapBuffer(bg), 0);
                PutWMFaceOnBg(
                    GetWMFaceBg(),
                    GetWMFaceVramOffset(),
                    faceProc->xPos,
                    0x1c,
                    (*yptrUnsigned >> 10) & 1
                );
                BG_EnableSyncByMask(1 << (bg));

                break;

            case 2:
                BG_Fill(BG_GetMapBuffer(bg), 0);
                BG_EnableSyncByMask(1 << (bg));

                break;
            }
        }
    }
}
