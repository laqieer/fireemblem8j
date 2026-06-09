	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80C1248, "ax", %progbits
@ sub_80C1248 @ JP 0x080C1248 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1248
	.thumb_func
sub_80C1248:
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x34
	ldrb r0, [r4]
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	ldrb r4, [r4]
	lsls r0, r4
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

