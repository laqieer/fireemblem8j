	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_8077970, 0x08077970 + 1
	.set sub_8077B50, 0x08077B50 + 1
	.set sub_8077CD4, 0x08077CD4 + 1
	.section .text.sub_8077894, "ax", %progbits
@ sub_8077894 @ JP 0x08077894 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077894
	.thumb_func
sub_8077894:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080778CA
	ldr r0, [r5, #0x5c]
	ldr r1, [r5, #0x44]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x4c]
	ldr r4, [r5, #0x50]
	str r4, [sp]
	bl sub_8077970
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl sub_8074E80
_080778CA:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x30
	bne _080778F0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x44]
	ldr r3, [r5, #0x4c]
	movs r1, #0
	bl sub_8077B50
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl sub_8074E80
_080778F0:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x3c
	bne _08077908
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl sub_8054BF8
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_8077CD4
_08077908:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0x4f
	bne _0807792E
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x48]
	ldr r3, [r5, #0x50]
	movs r1, #1
	bl sub_8077B50
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xe2
	movs r3, #1
	bl sub_8074E80
_0807792E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x5b
	bne _0807793C
	ldr r1, _0807796C @ =0x0202013C
	movs r0, #1
	str r0, [r1]
_0807793C:
	movs r3, #0x2c
	ldrsh r0, [r5, r3]
	cmp r0, #0x60
	bne _08077954
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl sub_8054BF8
	ldr r0, [r5, #0x5c]
	movs r1, #0xa
	bl sub_8077CD4
_08077954:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x78
	bne _08077962
	adds r0, r5, #0
	bl sub_8002DE4
_08077962:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807796C: .4byte 0x0202013C

