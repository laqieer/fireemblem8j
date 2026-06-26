typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed char s8;
typedef signed short s16;
typedef int s32;

#define OAM0_Y(ay)     ((ay) & 0x00FF)
#define OAM0_BLEND     0x0400
#define OAM1_X(ax)     ((ax) & 0x01FF)
#define OAM2_LAYER(al) (((al) & 0x3) << 10)
#define OAM2_PAL(ap)   (((ap) & 0xF) << 12)
#define CHR_SIZE 0x20

struct GmScreenProc;
struct APHandle;

struct GmNodeIconDisplayProc
{
    /* 00 */ u8 proc_pad[0x2C];
    /* 2C */ u32 chr;
    /* 30 */ u8 pal;
    /* 31 */ u8 unk_31;
    /* 32 */ u8 skip : 1;
    /* 32 */ u8 merge_next_node : 1;
    /* 33 */ u8 nodeId;
    /* 34 */ u32 unk_34[1];
    /* 38 */ struct APHandle * ap;
    /* 3C */ struct GmScreenProc * pScreenProc;
};

struct GMapNodeData
{
    /* 00 */ u8 placementFlag;
    /* 01 */ s8 encounters;
    /* 02 */ u8 iconPreClear;
    /* 03 */ u8 iconPostClear;
    /* 04 */ u8 chapteridx_eirika;
    /* 05 */ u8 chapteridx_ephram;
    /* 06 */ s16 unk_06;
    /* 08 */ s8 unk_08[4];
    /* 0C */ u16 * armory;
    /* 10 */ u16 * vendor;
    /* 14 */ u16 * secretShop;
    /* 18 */ s16 x;
    /* 1A */ s16 y;
    /* 1C */ u16 nameTextId;
    /* 1E */ u8 shipTravelFlag;
    /* 1F */ u8 pad1f;
};

struct NodeIcon
{
    /* 00 */ u16 sheetTileId;
    /* 02 */ u8 pad02[2];
    /* 04 */ u16 * pSpriteData;
    /* 08 */ s8 xCenter;
    /* 09 */ s8 yCenter;
    /* 0A */ s8 width;
    /* 0B */ s8 height;
    /* 0C */ s8 xFlagOrigin;
    /* 0D */ s8 yFlagOrigin;
    /* 0E */ u8 pad0e[2];
};

struct GMScreenNode
{
    /* 00 */ u8 state;
    /* 01 */ u8 pad[3];
};

struct GMapData
{
    u8 pad[0x30];
    struct GMScreenNode nodes[0x1d];
};

struct GmScreenProc
{
    /* 00 */ u8 pad[0x34];
    /* 34 */ s16 x;
    /* 36 */ s16 y;
};

extern const struct GMapNodeData gWMNodeData[];
extern const struct NodeIcon gWMNodeIconData[];
extern struct GMapData gGMData;

extern s8 GmapScreen2_GetNodeScreenPos(struct GmScreenProc * proc, s16 xIn, s16 yIn, s16 * xOut, s16 * yOut);
extern void PutSpriteExt(int oamCfg, int x, int y, const u16 * sprite, int oam2);
extern void AP_Update(struct APHandle * ap, int x, int y);

void GmapScreen2_Loop(struct GmNodeIconDisplayProc * proc)
{
    int chr;
    int i;
    s16 local_2c;
    s16 local_2a;
    s16 local_28;
    s16 local_26;
    const struct GMapNodeData * node;
    const struct NodeIcon * icon;

    if (!proc->skip)
    {
        return;
    }

    chr = proc->chr / CHR_SIZE;

    for (i = 0; i < 0x1d; i++)
    {
        s16 x1, y1;
        if (!(gGMData.nodes[i].state & 1))
        {
            continue;
        }

        node = &i[gWMNodeData];

        icon = gWMNodeIconData + ((gGMData.nodes[i].state & 2) ? node->iconPreClear : node->iconPostClear);

        x1 = node->x - icon->xCenter;
        y1 = node->y - icon->yCenter;

        if (GmapScreen2_GetNodeScreenPos(proc->pScreenProc, x1, y1, &local_2c, &local_2a))
        {
            local_2c = OAM1_X(local_2c);
            local_2a = OAM0_Y(local_2a);

            if ((proc->unk_34[i / 0x20]) & (1 << (i & 0x1f)))
            {
                local_2a |= OAM0_BLEND;
            }

            PutSpriteExt(
                0xc,
                local_2c,
                local_2a,
                icon->pSpriteData,
                icon->sheetTileId + (chr) + OAM2_PAL(proc->pal) + OAM2_LAYER(2)
            );
        }
    }

    if (proc->merge_next_node)
    {
        node = &(proc->nodeId[gWMNodeData]);

        icon = gWMNodeIconData + ((gGMData.nodes[proc->nodeId].state & 2) ? node->iconPreClear : node->iconPostClear);

        *&local_28 = proc->pScreenProc->x;
        *&local_26 = proc->pScreenProc->y;

        local_2c = ((node->x - icon->xCenter) + icon->xFlagOrigin) - local_28;
        local_2a = ((node->y - icon->yCenter) + icon->yFlagOrigin) - local_26;

        if ((local_2a >= -0x20 && local_2a < 0xC0) && (local_2c >= -0x20 && local_2c < 0x110))
        {
            s16 xOam1;
            s16 yOam0;
            if (gGMData.nodes[proc->nodeId].state & 2)
                xOam1 = OAM1_X(local_2c);
            else
                xOam1 = OAM1_X(local_2c);
            yOam0 = OAM0_Y(local_2a);

            if (((proc->unk_34[(proc->nodeId / 0x20)])) & (1 << (proc->nodeId & 0x1f)))
                yOam0 |= OAM0_BLEND;
            yOam0++; yOam0--;
            AP_Update(proc->ap, xOam1, yOam0);
        }
    }

    return;
}