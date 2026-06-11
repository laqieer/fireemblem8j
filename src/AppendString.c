#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

char * AppendString(const char * src, char * dst)
{
    strcpy(dst, src);
    return dst + strlen(src);
}
