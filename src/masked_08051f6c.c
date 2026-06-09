#include "gbafe.h"

void EkrGauge_SetWtaArrowSprite(struct EkrGaugeStruct1 *buf, int a, int b)
{
    if (a > 0) {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = gEkrgauge_6;
                return;
            }
        } else {
            buf->unk3C = gEkrgauge_7;
            return;
        }

        buf->unk3C = gEkrgauge_8;
    } else {
        if (b != 1) {
            unsigned int temp = 1;
            if (b < temp) {
                buf->unk3C = gEkrgauge_9;
                return;
            }
        } else {
            buf->unk3C = gEkrgauge_10;
            return;
        }

        buf->unk3C = gEkrgauge_11;
    }
}
