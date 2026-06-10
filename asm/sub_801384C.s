	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013608, 0x08013608 + 1
	.section .text.sub_801384C, "ax", %progbits
@ sub_801384C @ JP 0x0801384C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801384C
	.thumb_func
sub_801384C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r2, r1, r0
	str r2, [r4, #0x44]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r3, r7, r2
	ldr r0, [r4, #0x2c]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x38]
	muls r0, r2, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _08013870
	adds r0, #0xff
_08013870:
	asrs r6, r0, #8
	ldr r0, [r4, #0x30]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x3c]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _08013884
	adds r1, #0xff
_08013884:
	asrs r5, r1, #8
	ldr r0, [r4, #0x34]
	adds r1, r0, #0
	muls r1, r3, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	adds r1, r1, r0
	cmp r1, #0
	bge _08013898
	adds r1, #0xff
_08013898:
	asrs r2, r1, #8
	ldr r3, [r4, #0x4c]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8013608
	ldr r0, [r4, #0x44]
	cmp r0, r7
	bne _080138B0
	adds r0, r4, #0
	bl sub_8002DE4
_080138B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

