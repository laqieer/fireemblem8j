	.syntax unified
	.set sub_80C7228, 0x080C7228 + 1
	.set sub_80C72B0, 0x080C72B0 + 1
	.section .text.sub_800CCC4, "ax", %progbits
@ sub_800CCC4 @ JP 0x0800CCC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CCC4
	.thumb_func
sub_800CCC4:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CCDA
	bl sub_80C72B0
	movs r0, #0
	b _0800CCE8
_0800CCDA:
	bl sub_80C7228
	cmp r0, #0
	bne _0800CCE6
	movs r0, #0
	b _0800CCE8
_0800CCE6:
	movs r0, #3
_0800CCE8:
	pop {r1}
	bx r1

