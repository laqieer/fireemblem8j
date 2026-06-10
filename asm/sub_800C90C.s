	.syntax unified
	.set sub_80C02AC, 0x080C02AC + 1
	.set sub_80C3238, 0x080C3238 + 1
	.section .text.sub_800C90C, "ax", %progbits
@ sub_800C90C @ JP 0x0800C90C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C90C
	.thumb_func
sub_800C90C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C91E
	bl sub_80C02AC
_0800C91E:
	bl sub_80C3238
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C92C
	movs r0, #3
	b _0800C92E
_0800C92C:
	movs r0, #2
_0800C92E:
	pop {r1}
	bx r1
	.align 2, 0

