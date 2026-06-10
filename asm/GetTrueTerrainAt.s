	.syntax unified
	.section .text.GetTrueTerrainAt, "ax", %progbits
@ GetTrueTerrainAt @ JP 0x080197CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetTrueTerrainAt
	.thumb_func
GetTrueTerrainAt:
	ldr r2, _080197E8 @ =0x085C2E54
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _080197EC @ =0x085C2E50
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080197E8: .4byte 0x085C2E54
_080197EC: .4byte 0x085C2E50

