	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80555C8, "ax", %progbits
@ NewEfxFlashUnitEffectEnd @ JP 0x080555C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxFlashUnitEffectEnd
	.thumb_func
NewEfxFlashUnitEffectEnd:
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
	ldr r0, _08055614 @ =0x085E3BEC
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
	ldrh r0, [r6, #0x10]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r6, #0x10]
	ldrh r1, [r6]
	movs r0, #8
	orrs r0, r1
	strh r0, [r6]
	movs r0, #2
	strh r0, [r6, #6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055614: .4byte 0x085E3BEC

