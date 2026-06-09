#include "global.h"
#include "sio.h"

// clang-format off

#define MULTIBOOT_MASTER_INFO            0x62
#define MULTIBOOT_CLIENT_INFO            0x72
#define MULTIBOOT_MASTER_START_PROBE     0x61
#define MULTIBOOT_MASTER_REQUEST_DLREADY 0x63
#define MULTIBOOT_CLIENT_DLREADY         0x73
#define MULTIBOOT_MASTER_START_DL        0x64
#define MULTIBOOT_MASTER_REQUEST_CRC     0x65
#define MULTIBOOT_CLIENT_CALC_CRC        0x74
#define MULTIBOOT_CLIENT_CRCREADY        0x75
#define MULTIBOOT_MASTER_VERIFY_CRC      0x66

//! FE8U = 0x0804E024
NAKEDFUNC
void MultiBootWaitCycles(u32 cycles)
{
    asm("\n\
        .syntax unified\n\
        mov r2, pc\n\
        lsrs r2, r2, #0x18\n\
        movs r1, #0xc\n\
        cmp r2, #2\n\
        beq MultiBootWaitCyclesLoop\n\
        movs r1, #0xd\n\
        cmp r2, #8\n\
        beq MultiBootWaitCyclesLoop\n\
        movs r1, #4\n\
    MultiBootWaitCyclesLoop:\n\
        subs r0, r0, r1\n\
        bgt MultiBootWaitCyclesLoop\n\
        bx lr\n\
        .syntax divided\n\
    ");
}

//! FE8U = 0x0804E03C
void MultiBootWaitSendDone(void)
{
    int i;

    for (i = 0; i < 0x0000795D; i++)
    {
        if ((REG_SIOCNT & SIO_START) == 0)
        {
            break;
        }
    }

    MultiBootWaitCycles(600);
}
