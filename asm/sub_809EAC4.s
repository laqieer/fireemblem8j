	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8029E8C, 0x08029E8C + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_809E144, 0x0809E144 + 1
	.set sub_809E6B4, 0x0809E6B4 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809EAC4, "ax", %progbits
@ sub_809EAC4 @ JP 0x0809EAC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EAC4
	.thumb_func
sub_809EAC4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809EAEC
	ldr r0, _0809EAE8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809EB94
	bl sub_808B2A4
	movs r0, #0xff
	b _0809EBDC
	.align 2, 0
_0809EAE8: .4byte 0x085775CC
_0809EAEC:
	ldr r0, _0809EB4C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809EBC0
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0809EB6C
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0x30]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_8029E8C
	cmp r0, #0
	beq _0809EB54
	ldr r2, [r4, #0x30]
	str r2, [r4, #0x34]
	lsls r2, r2, #4
	adds r2, #0x48
	movs r0, #0
	movs r1, #0x10
	movs r3, #0
	bl sub_80B1474
	str r5, [r4, #0x3c]
	ldr r0, _0809EB50 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EB42
	movs r0, #0x6a
	bl m4aSongNumStart
_0809EB42:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _0809EBDE
	.align 2, 0
_0809EB4C: .4byte 0x085775CC
_0809EB50: .4byte 0x0202BCEC
_0809EB54:
	ldr r0, _0809EB68 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EBDE
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809EBDE
	.align 2, 0
_0809EB68: .4byte 0x0202BCEC
_0809EB6C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809EB94
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809EB90 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EBDE
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809EBDE
	.align 2, 0
_0809EB90: .4byte 0x0202BCEC
_0809EB94:
	adds r0, r4, #0
	bl sub_809E144
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EBDE
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	bl sub_809E6B4
	ldr r0, [r4, #0x38]
	cmp r0, #0xff
	beq _0809EBDE
_0809EBC0:
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x30]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _0809EBDE
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	ldr r0, [r4, #0x30]
_0809EBDC:
	str r0, [r4, #0x38]
_0809EBDE:
	pop {r4, r5}
	pop {r0}
	bx r0

