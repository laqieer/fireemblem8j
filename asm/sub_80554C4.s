	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80554C4, "ax", %progbits
@ NewEfxFlashUnit @ JP 0x080554C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxFlashUnit
	.thumb_func
NewEfxFlashUnit:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r0, _080554FC @ =0x085E3BC4
	movs r1, #4
	bl sub_8002BCC
	str r6, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	adds r0, #0x29
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080554FC: .4byte 0x085E3BC4

