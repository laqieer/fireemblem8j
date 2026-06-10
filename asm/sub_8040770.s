	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8040770, "ax", %progbits
@ sub_8040770 @ JP 0x08040770 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040770
	.thumb_func
sub_8040770:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, _080407A0 @ =0x080DD3D0
	ldrh r0, [r3]
	cmp r0, #0
	beq _080407B4
	movs r1, #0
	adds r2, r3, #0
	adds r6, r2, #4
_0804078E:
	ldrh r0, [r2]
	cmp r5, r0
	bne _080407A4
	adds r0, r1, r6
	ldr r0, [r0]
	cmp r0, #0
	beq _080407A4
	adds r0, r4, #0
	b _080407B8
	.align 2, 0
_080407A0: .4byte 0x080DD3D0
_080407A4:
	adds r1, #8
	adds r2, #8
	adds r4, #1
	ldr r3, _080407C0 @ =0x080DD3D0
	adds r0, r1, r3
	ldrh r0, [r0]
	cmp r0, #0
	bne _0804078E
_080407B4:
	movs r0, #1
	rsbs r0, r0, #0
_080407B8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080407C0: .4byte 0x080DD3D0

