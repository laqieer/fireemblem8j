	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnit, 0x08019108 + 1
	.set IsItemHammernable, 0x08016E28 + 1
	.set sub_8016688, 0x08016688 + 1
	.section .text.sub_8029A10, "ax", %progbits
@ RepairMenuItemDraw @ JP 0x08029A10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RepairMenuItemDraw
	.thumb_func
RepairMenuItemDraw:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08029A64 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl IsItemHammernable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08029A68 @ =0x02022CA8
	adds r3, r3, r1
	adds r1, r4, #0
	bl sub_8016688
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08029A64: .4byte 0x0203A954
_08029A68: .4byte 0x02022CA8

