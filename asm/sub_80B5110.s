	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B5110, "ax", %progbits
@ ExtramenuUnk_LoadGfx @ JP 0x080B5110 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ExtramenuUnk_LoadGfx
	.thumb_func
ExtramenuUnk_LoadGfx:
	push {lr}
	ldr r0, _080B51A4 @ =0x08BB059C
	movs r1, #0
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080B51A8 @ =0x08AA7310
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B51AC @ =0x08BABE04
	ldr r1, _080B51B0 @ =0x06001000
	bl sub_8013008
	ldr r0, _080B51B4 @ =0x02022CA8
	ldr r1, _080B51B8 @ =0x08AA7330
	movs r2, #0x80
	bl j_TmApplyTsa
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080B51BC @ =0x08AA9E78
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_8000D68
	ldr r0, _080B51C0 @ =0x08AA77E4
	ldr r1, _080B51C4 @ =0x06010800
	bl sub_8013008
	ldr r0, _080B51C8 @ =0x08AA8F40
	ldr r1, _080B51CC @ =0x06014000
	bl sub_8013008
	ldr r0, _080B51D0 @ =ExtramenuUnk_HBlank
	bl SetPrimaryHBlankHandler
	ldr r2, _080B51D4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldrb r0, [r2, #0xc]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	movs r3, #2
	orrs r0, r3
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	orrs r1, r3
	strb r1, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_080B51A4: .4byte 0x08BB059C
_080B51A8: .4byte 0x08AA7310
_080B51AC: .4byte 0x08BABE04
_080B51B0: .4byte 0x06001000
_080B51B4: .4byte 0x02022CA8
_080B51B8: .4byte 0x08AA7330
_080B51BC: .4byte 0x08AA9E78
_080B51C0: .4byte 0x08AA77E4
_080B51C4: .4byte 0x06010800
_080B51C8: .4byte 0x08AA8F40
_080B51CC: .4byte 0x06014000
_080B51D0: .4byte 0x080B5071  @ ExtramenuUnk_HBlank
_080B51D4: .4byte 0x03003020

