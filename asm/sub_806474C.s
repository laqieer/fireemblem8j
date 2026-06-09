	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806474C, "ax", %progbits
@ sub_806474C @ JP 0x0806474C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806474C
	.thumb_func
sub_806474C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _080647A8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080647AC @ =0x086011C8
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _080647B0 @ =0x080E30C4
	str r0, [r5, #0x48]
	ldr r0, _080647B4 @ =0x086011E0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080647B8 @ =0x08754820
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _080647BC @ =0x08754544
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _080647C0 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080647CE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080647C4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _080647CE
	.align 2, 0
_080647A8: .4byte 0x0201774C
_080647AC: .4byte 0x086011C8
_080647B0: .4byte 0x080E30C4
_080647B4: .4byte 0x086011E0
_080647B8: .4byte 0x08754820
_080647BC: .4byte 0x08754544
_080647C0: .4byte 0x0203E11C
_080647C4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_080647CE:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0

