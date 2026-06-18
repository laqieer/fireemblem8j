	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8069114, "ax", %progbits
@ efxMaohFlashEyeLOBJ2_Loop @ JP 0x08069114 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxMaohFlashEyeLOBJ2_Loop
	.thumb_func
efxMaohFlashEyeLOBJ2_Loop:
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
	bne _0806913E
	ldr r0, _08069144 @ =0x0201774C
	ldr r1, [r0]
	subs r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_0806913E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069144: .4byte 0x0201774C

