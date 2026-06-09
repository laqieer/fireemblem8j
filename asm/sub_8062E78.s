	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_805660C, 0x0805660C + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8062E78, "ax", %progbits
@ sub_8062E78 @ JP 0x08062E78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062E78
	.thumb_func
sub_8062E78:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08062ED0
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r6, #0
	bl sub_805660C
	ldr r0, _08062EC8 @ =0x080E2AC4
	lsls r1, r5, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldr r2, _08062ECC @ =0x080E2ACC
	adds r1, r1, r2
	ldrh r2, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #0
	bl sub_8074E80
	b _08062EEE
	.align 2, 0
_08062EC8: .4byte 0x080E2AC4
_08062ECC: .4byte 0x080E2ACC
_08062ED0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08062EEE
	bl sub_8056130
	ldr r1, _08062EF4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_08062EEE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08062EF4: .4byte 0x0201774C

