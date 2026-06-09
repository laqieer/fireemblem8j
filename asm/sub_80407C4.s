	.syntax unified
	.set GetItemType, 0x080172F0 + 1
	.set sub_8040770, 0x08040770 + 1
	.set sub_8040BDC, 0x08040BDC + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80407C4, "ax", %progbits
@ sub_80407C4 @ JP 0x080407C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80407C4
	.thumb_func
sub_80407C4:
	push {r4, r5, r6, lr}
	ldr r0, _080407D8 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080407DC
	movs r0, #0
	b _08040856
	.align 2, 0
_080407D8: .4byte 0x0203AA00
_080407DC:
	bl sub_8040BDC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040854
	movs r5, #0
	ldr r0, _08040844 @ =0x03004DF0
	ldr r0, [r0]
	ldrh r4, [r0, #0x1e]
	cmp r4, #0
	beq _08040830
	ldr r6, _08040848 @ =0x080DD3D4
_080407F4:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0
	beq _0804081A
	adds r0, r4, #0
	bl sub_8040770
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804081A
	lsls r0, r1, #3
	adds r0, r0, r6
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_80D65C0
_0804081A:
	adds r5, #1
	cmp r5, #4
	bgt _08040830
	ldr r0, _08040844 @ =0x03004DF0
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080407F4
_08040830:
	ldr r0, _0804084C @ =0x0203AA00
	adds r0, #0x79
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040854
	ldr r0, _08040850 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08040856
	.align 2, 0
_08040844: .4byte 0x03004DF0
_08040848: .4byte 0x080DD3D4
_0804084C: .4byte 0x0203AA00
_08040850: .4byte 0x0203AA90
_08040854:
	movs r0, #1
_08040856:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

