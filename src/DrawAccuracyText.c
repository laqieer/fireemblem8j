#include "global.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmitem.h"
#include "unitinfowindow.h"
#include "constants/classes.h"

//! FE8U = 0x08034BE4
void DrawAccuracyText(struct Text* text, int accuracy) {
    ClearText(text);

    Text_InsertDrawString(text, 0, 3, GetStringFromIndex(0x483)); // TODO: msgid "Hit[.]"
    Text_InsertDrawNumberOrBlank(text, 56, 2, accuracy);

    return;
}
