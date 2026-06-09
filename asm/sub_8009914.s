	.syntax unified
	.set StartMuralBackground, 0x08088E74 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80156F0, 0x080156F0 + 1
	.section .text.sub_8009914, "ax", %progbits
@ sub_8009914 @ JP 0x08009914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009914
	.thumb_func
sub_8009914:
	push {lr}
	movs r0, #0
	bl sub_8001ACC
	bl sub_80156F0
	ldr r2, _08009944 @ =0x0202BCEC
	adds r2, #0x40
	ldrb r1, [r2]
	movs r0, #0x61
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #3
	movs r1, #0
	bl StartMuralBackground
	pop {r0}
	bx r0
	.align 2, 0
_08009944: .4byte 0x0202BCEC

