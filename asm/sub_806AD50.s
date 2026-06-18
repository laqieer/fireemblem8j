	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.section .text.sub_806AD50, "ax", %progbits
@ efxNaglfarOBJ_Loop @ JP 0x0806AD50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxNaglfarOBJ_Loop
	.thumb_func
efxNaglfarOBJ_Loop:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _0806AD7C
	bl sub_8056130
	bl sub_8056214
	ldr r1, _0806AD84 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806AD7C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806AD84: .4byte 0x0201774C

