	.syntax unified
	.section .text.sub_800CF2C, "ax", %progbits
@ sub_800CF2C @ JP 0x0800CF2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CF2C
	.thumb_func
sub_800CF2C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CF3E
	movs r0, #2
	b _0800CF40
_0800CF3E:
	movs r0, #0
_0800CF40:
	pop {r1}
	bx r1

