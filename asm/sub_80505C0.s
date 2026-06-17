	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.ClearMenuBgs, "ax", %progbits
@ ClearMenuBgs @ JP 0x080505C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearMenuBgs
	.thumb_func
ClearMenuBgs:
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x64
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0

