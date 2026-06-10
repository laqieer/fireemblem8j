	.syntax unified
	.set BmMapInit, 0x0801947C + 1
	.set InitBaseTilesBmMap, 0x0801967C + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8019584, 0x08019584 + 1
	.set sub_801973C, 0x0801973C + 1
	.section .text.InitMapForMinimap, "ax", %progbits
@ InitMapForMinimap @ JP 0x08019294 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitMapForMinimap
	.thumb_func
InitMapForMinimap:
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r0, _080192E4 @ =0x02001000
	bl sub_8019584
	ldr r0, _080192E8 @ =0x0202E4F0
	ldr r6, _080192EC @ =0x0202E4D4
	ldr r4, _080192F0 @ =0x0202E4D0
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	bl BmMapInit
	ldr r0, _080192F4 @ =0x0202ECA8
	ldr r5, _080192F8 @ =0x0202E4D8
	movs r1, #0
	ldrsh r2, [r4, r1]
	movs r1, #2
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	bl BmMapInit
	ldr r0, [r6]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r5]
	movs r1, #0
	bl sub_80194BC
	bl InitBaseTilesBmMap
	bl sub_801973C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080192E4: .4byte 0x02001000
_080192E8: .4byte 0x0202E4F0
_080192EC: .4byte 0x0202E4D4
_080192F0: .4byte 0x0202E4D0
_080192F4: .4byte 0x0202ECA8
_080192F8: .4byte 0x0202E4D8

