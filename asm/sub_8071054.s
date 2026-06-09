	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8071054, "ax", %progbits
@ sub_8071054 @ JP 0x08071054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071054
	.thumb_func
sub_8071054:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl sub_8070F08
	adds r5, r0, #0
	ldrh r4, [r5, #0xa]
	lsls r4, r4, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldr r1, [r5, #0x18]
	adds r0, r6, #0
	bl sub_80D6394
	ldr r0, [r5, #0x18]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r4, #0
	bl RegisterDataMove
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

