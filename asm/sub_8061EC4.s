	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set FillBGRect, 0x080732A0 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8061EC4, "ax", %progbits
@ sub_8061EC4 @ JP 0x08061EC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061EC4
	.thumb_func
sub_8061EC4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08061F60
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _08061F00
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl sub_80567B8
_08061F00:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl sub_805660C
	ldr r0, _08061F3C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061F7E
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _08061F44
	ldr r0, _08061F40 @ =0x020234A8
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _08061F54
	.align 2, 0
_08061F3C: .4byte 0x0203E11C
_08061F40: .4byte 0x020234A8
_08061F44:
	ldr r0, _08061F5C @ =0x020234E2
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_08061F54:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _08061F7E
	.align 2, 0
_08061F5C: .4byte 0x020234E2
_08061F60:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08061F7E
	bl sub_8056130
	ldr r1, _08061F8C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_08061F7E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061F8C: .4byte 0x0201774C

