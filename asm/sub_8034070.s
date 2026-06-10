	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_8034070, "ax", %progbits
@ sub_8034070 @ JP 0x08034070 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034070
	.thumb_func
sub_8034070:
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	ldr r2, _08034098 @ =0x0202BCEC
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08034098: .4byte 0x0202BCEC

