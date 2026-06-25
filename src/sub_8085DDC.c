#include "global.h"
#include "eventinfo.h"

#define EVT_CMD_HI(cmd) (((cmd) & 0xFFFF0000) >> 16)
#define EVT_CMD_B1(cmd) (((cmd) & 0x000000FF))
#define EVT_CMD_B2(cmd) (((cmd) & 0x0000FF00) >> 8)
#define EVT_CMD_B3(cmd) (((cmd) & 0x00FF0000) >> 16)
#define EVT_CMD_B4(cmd) (((cmd) & 0xFF000000) >> 24)

struct EvCheck0B {
    u32 unk0;
    u32 script;
    u32 unk8;
};

int sub_8085DDC(struct EventInfo * info)
{
    s8 x = gActiveUnit->xPos;
    s8 y = gActiveUnit->yPos;

    s8 x1 = EVT_CMD_B1(((struct EvCheck0B *)info->listScript)->unk8);
    s8 y1 = EVT_CMD_B2(((struct EvCheck0B *)info->listScript)->unk8);
    s8 x2 = EVT_CMD_B3(((struct EvCheck0B *)info->listScript)->unk8);
    s8 y2 = EVT_CMD_B4(((struct EvCheck0B *)info->listScript)->unk8);

    if ((x1 <= x && x <= x2) || (x2 <= x && x <= x1)) {
        if ((y1 <= y && y <= y2) || (y2 <= y && y <= y1)) {
            info->script = ((struct EvCheck0B *)info->listScript)->script;
            info->flag = EVT_CMD_HI(((struct EvCheck0B *)info->listScript)->unk0);

            return 1;
        }
    }

    return 0;
}
