	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8060E5C, "ax", %progbits
@ sub_8060E5C @ JP 0x08060E5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060E5C
	.thumb_func
sub_8060E5C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060E88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060E8C @ =0x0860051C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	movs r1, #7
	str r1, [r0, #0x44]
	strh r2, [r0, #0x2e]
	movs r1, #6
	str r1, [r0, #0x48]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060E88: .4byte 0x0201774C
_08060E8C: .4byte 0x0860051C

