#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "gamecontrol.h"
#include "opanim.h"

void OpAnimPutObjCommon(int ix, int iy, u8 a, u8 b)
{
    const u16 * obj;
    int oam2_chr;
    u16 oam2;

    switch (a) {
    case 0:
        switch (b) {
        case 0:
            oam2_chr = 0xCE;
            obj = Obj_Opanimfx_1;
            break;

        case 1:
            oam2_chr = 0xCE;
            obj = Obj_Opanimfx_2;
            break;

        case 2:
            oam2_chr = 0xF6;
            obj = Obj_Opanimfx_1;
            break;

        case 3:
            oam2_chr = 0xF6;
            obj = Obj_Opanimfx_2;
            break;

        default:
            break;
        }
        break;

    case 1:
        switch (b) {
        case 0:
            oam2_chr = 0x11E;
            obj = Obj_Opanimfx_3;
            break;

        case 1:
            oam2_chr = 0x11E;
            obj = Obj_Opanimfx_4;
            break;

        case 2:
            oam2_chr = 0x136;
            obj = Obj_Opanimfx_3;
            break;

        case 3:
            oam2_chr = 0x136;
            obj = Obj_Opanimfx_4;
            break;

        default:
            break;
        }
        break;

    case 2:
        switch (b) {
        case 0:
            oam2_chr = 0x14E;
            obj = Obj_Opanimfx_5;
            break;

        case 1:
            oam2_chr = 0x14E;
            obj = Obj_Opanimfx_6;
            break;

        case 2:
            oam2_chr = 0x15A;
            obj = Obj_Opanimfx_5;
            break;

        case 3:
            oam2_chr = 0x15A;
            obj = Obj_Opanimfx_6;
            break;

        case 4:
            oam2_chr = 0x17E;
            obj = Obj_Opanimfx_5;
            break;

        case 5:
            oam2_chr = 0x17E;
            obj = Obj_Opanimfx_6;
            break;
        }
        break;

    case 3:
        switch (b) {
        case 0:
            oam2_chr = 0x166;
            obj = Obj_Opanimfx_7;
            break;

        case 1:
            oam2_chr = 0x166;
            obj = Obj_Opanimfx_8;
            break;

        case 2:
            oam2_chr = 0x16A;
            obj = Obj_Opanimfx_7;
            break;

        case 3:
            oam2_chr = 0x16A;
            obj = Obj_Opanimfx_8;
            break;

        case 4:
            oam2_chr = 0x172;
            obj = Obj_Opanimfx_7;
            break;

        case 5:
            oam2_chr = 0x172;
            obj = Obj_Opanimfx_8;
            break;
        }
        break;

    case 4:
        switch (b) {
        case 0:
            oam2_chr = 0x16E;
            obj = Obj_Opanimfx_9;
            break;

        case 1:
            oam2_chr = 0x16E;
            obj = Obj_Opanimfx_10;
            break;

        case 2:
            oam2_chr = 0x170;
            obj = Obj_Opanimfx_9;
            break;

        case 3:
            oam2_chr = 0x170;
            obj = Obj_Opanimfx_10;
            break;

        case 4:
            oam2_chr = 0x176;
            obj = Obj_Opanimfx_9;
            break;

        case 5:
            oam2_chr = 0x176;
            obj = Obj_Opanimfx_10;
            break;

        case 6:
            oam2_chr = 0x178;
            obj = Obj_Opanimfx_9;
            break;

        case 7:
            oam2_chr = 0x178;
            obj = Obj_Opanimfx_10;
            break;

        case 8:
            oam2_chr = 0x17A;
            obj = Obj_Opanimfx_9;
            break;

        case 9:
            oam2_chr = 0x17A;
            obj = Obj_Opanimfx_10;
            break;

        case 10:
            oam2_chr = 0x17C;
            obj = Obj_Opanimfx_9;
            break;

        case 11:
            oam2_chr = 0x17C;
            obj = Obj_Opanimfx_10;
            break;
        }
        break;
    }
    oam2 = 0x3000 | oam2_chr;
    PutSpriteExt(0, ix, iy, obj, oam2);
}
