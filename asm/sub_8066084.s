	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set FillBGRect, 0x080732A0 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8066084, "ax", %progbits
@ sub_8066084 @ JP 0x08066084 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066084
	.thumb_func
sub_8066084:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080660FC
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_805660C
	ldr r0, _080660D8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806611A
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _080660E0
	ldr r0, _080660DC @ =0x020234A8
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080660F0
	.align 2, 0
_080660D8: .4byte 0x0203E11C
_080660DC: .4byte 0x020234A8
_080660E0:
	ldr r0, _080660F8 @ =0x020234E2
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_080660F0:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _0806611A
	.align 2, 0
_080660F8: .4byte 0x020234E2
_080660FC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806611A
	bl sub_8056130
	ldr r1, _08066124 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_0806611A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066124: .4byte 0x0201774C

