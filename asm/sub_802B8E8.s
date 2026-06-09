	.syntax unified
	.set Roll1RN, 0x08000C78 + 1
	.section .text.sub_802B8E8, "ax", %progbits
@ sub_802B8E8 @ JP 0x0802B8E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B8E8
	.thumb_func
sub_802B8E8:
	push {r4, lr}
	movs r4, #0
	cmp r0, #0x64
	ble _0802B8F8
_0802B8F0:
	adds r4, #1
	subs r0, #0x64
	cmp r0, #0x64
	bgt _0802B8F0
_0802B8F8:
	bl Roll1RN
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802B904
	adds r4, #1
_0802B904:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

