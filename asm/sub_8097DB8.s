	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set sub_8012414, 0x08012414 + 1
	.set sub_80976A0, 0x080976A0 + 1
	.section .text.sub_8097DB8, "ax", %progbits
@ sub_8097DB8 @ JP 0x08097DB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097DB8
	.thumb_func
sub_8097DB8:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_80976A0
	movs r0, #0
	str r0, [r4, #0x40]
	strh r0, [r4, #0x3c]
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097DDA
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #5
	b _08097DE2
_08097DDA:
	bl sub_8012414
	adds r1, r4, #0
	adds r1, #0x2a
_08097DE2:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	subs r0, #9
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

