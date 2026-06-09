	.syntax unified
	.set SioSend, 0x08042238 + 1
	.section .text.sub_8048600, "ax", %progbits
@ sub_8048600 @ JP 0x08048600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048600
	.thumb_func
sub_8048600:
	push {r4, lr}
	ldr r0, _0804862C @ =0x03004EFC
	movs r2, #0
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _08048630 @ =0x085D31E8
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	beq _08048634
	movs r0, #1
	b _08048640
	.align 2, 0
_0804862C: .4byte 0x03004EFC
_08048630: .4byte 0x085D31E8
_08048634:
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	movs r0, #0
_08048640:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

