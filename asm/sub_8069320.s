	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8069320, "ax", %progbits
@ efxMaohFlashEyeFire1OBJ1_Loop @ JP 0x08069320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxMaohFlashEyeFire1OBJ1_Loop
	.thumb_func
efxMaohFlashEyeFire1OBJ1_Loop:
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
	bne _0806934A
	ldr r0, _08069350 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0806934A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069350: .4byte 0x0201774C

