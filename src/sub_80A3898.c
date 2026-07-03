#include "global.h"
#include "hardware.h"
#include "proc.h"

// JP-only screen-setup wrapper @ 0x080A3898 (pure call-sequence)
void sub_80A2D48(void);
void ResetSysHandCursor(struct Proc* proc);
void DisplaySysHandCursorTextShadow(int a, int b);
void SetUiSpinningArrowConfig(int a);
void SetUiSpinningArrowPositions(int a, int b, int c, int d);
void PutImg_PrepItemUseUnk(int a, int b);

void sub_80A3898(struct Proc* proc)
{
    sub_80A2D48();
    ResetSysHandCursor(proc);
    DisplaySysHandCursorTextShadow(0xC0 << 3, 1);
    StartUiSpinningArrows(proc);
    LoadUiSpinningArrowGfx(0, 0xA0 << 2, 2);
    SetUiSpinningArrowConfig(3);
    SetUiSpinningArrowPositions(0, 0x40, 0xE8, 0x40);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    SetBlendConfig(0, 0, 0, 0);
    PutImg_PrepItemUseUnk(0xA0 << 7, 5);
}
