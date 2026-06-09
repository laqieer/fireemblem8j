	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_80598F8, "ax", %progbits
@ sub_80598F8 @ JP 0x080598F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80598F8
	.thumb_func
sub_80598F8:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	cmp r0, #0x87
	beq _0805992E
	cmp r0, #0x87
	bgt _0805991E
	cmp r0, #0x4a
	beq _0805992E
	cmp r0, #0x4a
	bgt _08059918
	cmp r0, #0x3e
	beq _0805992E
	b _08059932
_08059918:
	cmp r0, #0x85
	beq _0805992E
	b _08059932
_0805991E:
	cmp r0, #0x8e
	beq _0805992E
	cmp r0, #0x8e
	blt _08059932
	cmp r0, #0x94
	bgt _08059932
	cmp r0, #0x91
	blt _08059932
_0805992E:
	movs r0, #1
	b _08059934
_08059932:
	movs r0, #0
_08059934:
	pop {r1}
	bx r1

