#include "global.h"
#include "hardware.h"

void AddAttr2dBitMap(u16 * _dst, u16 * _src, s16 ix, s16 iy, u16 chr) // TODO: handle type of a1
{
    u16 *dst;
    s16 width, height;
    s16 _width;
    s16 _height;
    s16 _ix, _iy;

    width = ((u8 *)_src)[0] + 1;
    height = ((u8 *)_src)[1] + 1;
    _width = width;
    /* Zero-instruction basic-block separator (agbcc emits no code for this
     * statement itself). Without it, agbcc's register allocator emits the
     * `_width = width;` / `_height = height;` callee-saved-register saves
     * (`mov ip,r6` / `mov r8,r2`) in the opposite order from the JP build --
     * a local-alloc save-order tie-break, not a source value/logic change.
     * See docs/agbcc_codegen_levers.md sec.7 and the "zero-instruction BB
     * separators" lever in docs/decomp_agent_playbook.md sec.1. */
    do {} while (0);
    _height = height;
    ++_src;
    _iy = 0;
    _ix = 0;

    if (ix + width > 0x20)
        width = 0x20 - ix;

    if (ix < 0)
    {
        _ix = -ix;
        width -= _ix;
        ix = 0;
    }

    if (width > 0)
    {
        int i, j;
        if (iy + height > 0x20)
            height = 0x20 - iy;

        if (iy < 0)
        {
            _iy = -iy;
            height -= _iy;
            iy = 0;
        }

        if (height > 0)
        {
            _src += _width * (_height - (_iy + height));
            dst = _dst + (iy + height - 1) * 0x20 + ix;

            for (i = height - 1; i >= 0; --i)
            {
                u16 *dst2 = dst;
                const u16 *src = _src + _ix;

                for (j = 0; width > j; ++j)
                {
                    *dst2 = *src + chr;
                    ++src;
                    ++dst2;
                }

                _src += _width;
                dst -= 0x20;
            }
        }
    }
}
