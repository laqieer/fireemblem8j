	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806C6F0, "ax", %progbits
@ sub_806C6F0 @ JP 0x0806C6F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C6F0
	.thumb_func
sub_806C6F0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806C710 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C714 @ =0x08602EAC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C710: .4byte 0x0201774C
_0806C714: .4byte 0x08602EAC

