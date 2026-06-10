	.syntax unified
	.set sub_8010FB4, 0x08010FB4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.section .text.sub_8010890, "ax", %progbits
@ sub_8010890 @ JP 0x08010890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010890
	.thumb_func
sub_8010890:
	push {r4, lr}
	adds r2, r0, #0
	adds r0, #0x68
	ldrh r0, [r0]
	movs r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _080108A6
	cmp r1, #4
	beq _080108C2
	b _080108DE
_080108A6:
	adds r0, r2, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	adds r1, r2, #0
	adds r1, #0x66
	movs r2, #0
	ldrsh r1, [r1, r2]
	lsls r1, r1, #4
	movs r2, #0
	bl sub_8015AB4
	b _080108DE
_080108C2:
	adds r0, r2, #0
	adds r0, #0x64
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r1, r2, #0
	adds r1, #0x66
	movs r3, #0
	ldrsh r1, [r1, r3]
	adds r4, r2, #0
	adds r4, #0x6a
	ldrh r2, [r4]
	bl sub_8010FB4
	strh r0, [r4]
_080108DE:
	pop {r4}
	pop {r0}
	bx r0

