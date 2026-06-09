	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_8070724, "ax", %progbits
@ sub_8070724 @ JP 0x08070724 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070724
	.thumb_func
sub_8070724:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08070774
	ldr r7, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	mov r8, r0
	ldr r0, [r4, #0x54]
	lsls r5, r1, #2
	adds r6, r5, r0
	ldr r0, [r4, #0x58]
	ldr r2, [r6]
	cmp r0, r2
	beq _0807075E
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r2, #0
	bl sub_80567B8
_0807075E:
	ldr r0, [r6]
	str r0, [r4, #0x58]
	ldr r0, [r4, #0x5c]
	adds r1, r5, r7
	ldr r1, [r1]
	mov r3, r8
	adds r2, r5, r3
	ldr r2, [r2]
	bl sub_805660C
	b _0807078A
_08070774:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807078A
	bl sub_8056130
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_0807078A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

