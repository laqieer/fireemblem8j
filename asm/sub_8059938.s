	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8059938, "ax", %progbits
@ sub_8059938 @ JP 0x08059938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8059938
	.thumb_func
sub_8059938:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x85
	beq _0805994A
	cmp r0, #0x92
	bne _0805994E
_0805994A:
	movs r0, #1
	b _08059950
_0805994E:
	movs r0, #0
_08059950:
	pop {r1}
	bx r1

