#include <stdarg.h>
#include <stdio.h>
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "constants/video-global.h"
#include "fontgrp.h"

//! FE8U = 0x08003CDC
void InitTextInitInfo(const struct TextInitInfo *info)
{
    while (info->text != NULL) {
        InitText(info->text, info->width);
        info++;
    }
}
