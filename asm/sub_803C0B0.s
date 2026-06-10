	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_803C0B0, "ax", %progbits
@ sub_803C0B0 @ JP 0x0803C0B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C0B0
	.thumb_func
sub_803C0B0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803C0F2
	movs r4, #2
	adds r0, r5, #0
	bl GetItemIndex
	cmp r0, #0x52
	beq _0803C0E6
	cmp r0, #0x52
	bgt _0803C0DC
	cmp r0, #0x51
	beq _0803C0E2
	b _0803C0EC
_0803C0DC:
	cmp r0, #0x53
	beq _0803C0EA
	b _0803C0EC
_0803C0E2:
	movs r4, #8
	b _0803C0EC
_0803C0E6:
	movs r4, #0x10
	b _0803C0EC
_0803C0EA:
	movs r4, #0x20
_0803C0EC:
	ldrb r0, [r6, #0xa]
	orrs r4, r0
	strb r4, [r6, #0xa]
_0803C0F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

