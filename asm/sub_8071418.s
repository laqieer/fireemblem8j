	.syntax unified
	.set EndActiveClassReelBgColorProc, 0x08070ED4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8071084, 0x08071084 + 1
	.section .text.sub_8071418, "ax", %progbits
@ sub_8071418 @ JP 0x08071418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071418
	.thumb_func
sub_8071418:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0807143E
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_8071084
	b _08071450
_0807143E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08071450
	bl EndActiveClassReelBgColorProc
	adds r0, r4, #0
	bl sub_8002DE4
_08071450:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

