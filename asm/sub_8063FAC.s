	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8063FAC, "ax", %progbits
@ sub_8063FAC @ JP 0x08063FAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063FAC
	.thumb_func
sub_8063FAC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08063FD0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063FD4 @ =0x08601030
	movs r1, #4
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063FD0: .4byte 0x0201774C
_08063FD4: .4byte 0x08601030

