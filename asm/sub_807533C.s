	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_807533C, "ax", %progbits
@ sub_807533C @ JP 0x0807533C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807533C
	.thumb_func
sub_807533C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08075394
	ldr r6, [r5, #0x4c]
	ldr r0, [r5, #0x50]
	mov r8, r0
	ldr r0, [r5, #0x54]
	ldr r5, [r5, #0x58]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	adds r5, r4, r5
	ldr r0, [r5]
	movs r1, #0x20
	bl sub_80567E0
	adds r6, r4, r6
	ldr r1, [r6]
	add r4, r8
	ldr r2, [r4]
	adds r0, r7, #0
	bl sub_805660C
	b _080753AA
_08075394:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080753AA
	bl sub_8056130
	bl sub_8056214
	adds r0, r5, #0
	bl Proc_End
_080753AA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

