	.syntax unified
	.set sub_80C4514, 0x080C4514 + 1
	.set sub_80C452C, 0x080C452C + 1
	.section .text.sub_800CB60, "ax", %progbits
@ sub_800CB60 @ JP 0x0800CB60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CB60
	.thumb_func
sub_800CB60:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CB76
	bl sub_80C452C
	movs r0, #0
	b _0800CB86
_0800CB76:
	bl sub_80C4514
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CB84
	movs r0, #3
	b _0800CB86
_0800CB84:
	movs r0, #2
_0800CB86:
	pop {r1}
	bx r1
	.align 2, 0

