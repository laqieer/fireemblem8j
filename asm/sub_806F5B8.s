	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806F5B8, "ax", %progbits
@ sub_806F5B8 @ JP 0x0806F5B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F5B8
	.thumb_func
sub_806F5B8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0806F614
	ldr r0, _0806F5F0 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806F5FE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806F5F4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _0806F5FE
	.align 2, 0
_0806F5F0: .4byte 0x0203E11C
_0806F5F4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_0806F5FE:
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl sub_805660C
	b _0806F632
_0806F614:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0806F632
	bl sub_8056130
	ldr r1, _0806F638 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl Proc_End
_0806F632:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F638: .4byte 0x0201774C

