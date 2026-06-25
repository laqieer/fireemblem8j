#include "global.h"
#include "hardware.h"
#include "proc.h"

// JP-only screen-setup wrapper @ 0x080A3898 (pure call-sequence)
void sub_80A2D48(void);
void sub_80B1F1C(struct Proc* proc);
void sub_80B1F40(int a, int b);
void sub_80B1780(struct Proc* proc);
void sub_80B1794(int a, int b, int c);
void sub_80B1800(int a);
void sub_80B181C(int a, int b, int c, int d);
void sub_809AF14(int a, int b);

void sub_80A3898(struct Proc* proc)
{
    sub_80A2D48();
    sub_80B1F1C(proc);
    sub_80B1F40(0xC0 << 3, 1);
    sub_80B1780(proc);
    sub_80B1794(0, 0xA0 << 2, 2);
    sub_80B1800(3);
    sub_80B181C(0, 0x40, 0xE8, 0x40);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    SetBlendConfig(0, 0, 0, 0);
    sub_809AF14(0xA0 << 7, 5);
}
