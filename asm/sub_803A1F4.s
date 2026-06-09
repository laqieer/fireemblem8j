	.syntax unified
	.set NewPopup_Simple, 0x08011560 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_802FB98, 0x0802FB98 + 1
	.set sub_808639C, 0x0808639C + 1
	.section .text.sub_803A1F4, "ax", %progbits
@ sub_803A1F4 @ JP 0x0803A1F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A1F4
	.thumb_func
sub_803A1F4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0803A230 @ =0x0203AA90
	ldrb r2, [r3, #2]
	ldrb r4, [r3, #3]
	ldr r0, _0803A234 @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _0803A240
	ldr r1, _0803A238 @ =0x03004DF0
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r1, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r1, #0x11]
	ldr r1, _0803A23C @ =0x0203A954
	movs r0, #0x1a
	strb r0, [r1, #0x11]
	ldrb r0, [r3, #7]
	strb r0, [r1, #0x12]
	adds r0, r5, #0
	bl sub_802FB98
	b _0803A26C
	.align 2, 0
_0803A230: .4byte 0x0203AA90
_0803A234: .4byte 0x0202E4D8
_0803A238: .4byte 0x03004DF0
_0803A23C: .4byte 0x0203A954
_0803A240:
	subs r1, r4, #1
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808639C
	ldr r0, _0803A274 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803A260
	movs r0, #0xab
	bl m4aSongNumStart
_0803A260:
	ldr r0, _0803A278 @ =0x085D1FAC
	movs r1, #0x60
	movs r2, #0
	adds r3, r5, #0
	bl NewPopup_Simple
_0803A26C:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A274: .4byte 0x0202BCEC
_0803A278: .4byte 0x085D1FAC

