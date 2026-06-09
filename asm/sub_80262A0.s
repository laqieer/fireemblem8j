	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set IsItemHammernable, 0x08016E28 + 1
	.set IsSameAllegiance, 0x08024D54 + 1
	.section .text.sub_80262A0, "ax", %progbits
@ sub_80262A0 @ JP 0x080262A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80262A0
	.thumb_func
sub_80262A0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080262C0 @ =0x02033F38
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl IsSameAllegiance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080262F0
	movs r5, #0
	b _080262C6
	.align 2, 0
_080262C0: .4byte 0x02033F38
_080262C4:
	adds r5, #1
_080262C6:
	cmp r5, #4
	bgt _080262F0
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl IsItemHammernable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080262C4
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_080262F0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

