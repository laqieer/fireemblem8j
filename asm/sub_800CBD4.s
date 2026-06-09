	.syntax unified
	.set sub_80C4FE4, 0x080C4FE4 + 1
	.set sub_80C500C, 0x080C500C + 1
	.section .text.sub_800CBD4, "ax", %progbits
@ sub_800CBD4 @ JP 0x0800CBD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CBD4
	.thumb_func
sub_800CBD4:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CBEA
	bl sub_80C4FE4
	movs r0, #0
	b _0800CBFA
_0800CBEA:
	bl sub_80C500C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CBF8
	movs r0, #3
	b _0800CBFA
_0800CBF8:
	movs r0, #2
_0800CBFA:
	pop {r1}
	bx r1
	.align 2, 0

