	.syntax unified
	.set FillBGRect, 0x080732A0 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806123C, "ax", %progbits
@ sub_806123C @ JP 0x0806123C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806123C
	.thumb_func
sub_806123C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080612B4
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl sub_805660C
	ldr r0, _08061294 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080612D2
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0806129C
	ldr r0, _08061298 @ =0x020234A8
	b _080612A0
	.align 2, 0
_08061294: .4byte 0x0203E11C
_08061298: .4byte 0x020234A8
_0806129C:
	ldr r0, _080612B0 @ =0x020234E2
	movs r1, #0
_080612A0:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080612D2
	.align 2, 0
_080612B0: .4byte 0x020234E2
_080612B4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080612D2
	bl sub_8056130
	ldr r1, _080612DC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r7, #0
	bl sub_8002DE4
_080612D2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080612DC: .4byte 0x0201774C

