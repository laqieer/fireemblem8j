	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804CEE8, "ax", %progbits
@ sub_804CEE8 @ JP 0x0804CEE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CEE8
	.thumb_func
sub_804CEE8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804CF14 @ =0x085D4910
	movs r1, #2
	bl sub_8002BCC
	ldr r2, [r4, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x34]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	lsls r1, r1, #1
	str r1, [r0, #0x38]
	adds r4, #0x41
	ldrb r1, [r4]
	adds r0, #0x41
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CF14: .4byte 0x085D4910

