	.syntax unified
	.section .text.sub_800C3F8, "ax", %progbits
@ sub_800C3F8 @ JP 0x0800C3F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C3F8
	.thumb_func
sub_800C3F8:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C40A
	movs r0, #2
	b _0800C40C
_0800C40A:
	movs r0, #0
_0800C40C:
	pop {r1}
	bx r1

