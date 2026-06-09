	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013608, 0x08013608 + 1
	.section .text.sub_8008FF0, "ax", %progbits
@ sub_8008FF0 @ JP 0x08008FF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008FF0
	.thumb_func
sub_8008FF0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	movs r7, #0x80
	lsls r7, r7, #1
	subs r2, r7, r1
	ldr r0, [r4, #0x40]
	muls r0, r2, r0
	lsls r1, r1, #8
	adds r0, r0, r1
	cmp r0, #0
	bge _08009010
	adds r0, #0xff
_08009010:
	asrs r6, r0, #8
	ldr r0, [r4, #0x48]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _0800901E
	adds r0, #0xff
_0800901E:
	asrs r5, r0, #8
	ldr r0, [r4, #0x44]
	muls r0, r2, r0
	adds r0, r0, r1
	cmp r0, #0
	bge _0800902C
	adds r0, #0xff
_0800902C:
	asrs r2, r0, #8
	ldr r3, [r4, #0x30]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8013608
	ldr r0, [r4, #0x3c]
	cmp r0, r7
	bne _08009044
	adds r0, r4, #0
	bl sub_8002DE4
_08009044:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

