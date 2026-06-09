	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_80776B4, 0x080776B4 + 1
	.set sub_8077788, 0x08077788 + 1
	.section .text.sub_80775F4, "ax", %progbits
@ sub_80775F4 @ JP 0x080775F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80775F4
	.thumb_func
sub_80775F4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0807761A
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	movs r1, #0
	bl sub_8077788
_0807761A:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x1c
	bne _0807762A
	adds r0, r5, #0
	movs r1, #6
	bl sub_8054BF8
_0807762A:
	movs r3, #0x2c
	ldrsh r0, [r4, r3]
	cmp r0, #0x22
	bne _0807765E
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x4c]
	adds r0, r5, #0
	movs r1, #0
	bl sub_80776B4
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	movs r1, #1
	bl sub_8077788
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
_0807765E:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x33
	bne _0807766E
	adds r0, r5, #0
	movs r1, #6
	bl sub_8054BF8
_0807766E:
	movs r3, #0x2c
	ldrsh r0, [r4, r3]
	cmp r0, #0x39
	bne _08077696
	ldr r2, [r4, #0x48]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	movs r1, #1
	bl sub_80776B4
	movs r0, #0x9a
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
_08077696:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x43
	bne _080776AA
	ldr r1, _080776B0 @ =0x0202013C
	movs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080776AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080776B0: .4byte 0x0202013C

