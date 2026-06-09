	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set sub_80BEE54, 0x080BEE54 + 1
	.section .text.sub_803409C, "ax", %progbits
@ sub_803409C @ JP 0x0803409C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803409C
	.thumb_func
sub_803409C:
	push {lr}
	sub sp, #4
	bl CheckInLinkArena
	cmp r0, #0
	bne _080340D0
	ldr r0, _080340BC @ =0x03005270
	ldrb r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080340C0
	bl sub_80BEE54
	b _080340D0
	.align 2, 0
_080340BC: .4byte 0x03005270
_080340C0:
	movs r2, #0x80
	lsls r2, r2, #1
	str r1, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x18
	bl ChangeBgm
_080340D0:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

