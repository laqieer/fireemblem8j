	.syntax unified
	.section .text.sub_800C3E0, "ax", %progbits
@ sub_800C3E0 @ JP 0x0800C3E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C3E0
	.thumb_func
sub_800C3E0:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C3F2
	movs r0, #2
	b _0800C3F4
_0800C3F2:
	movs r0, #0
_0800C3F4:
	pop {r1}
	bx r1

