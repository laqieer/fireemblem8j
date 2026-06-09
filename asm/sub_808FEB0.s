	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set FlushLCDControl, 0x08000E4C + 1
	.set Proc_Init, 0x08002B58 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set m4aSoundInit, 0x080D4E70 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_808FE1C, 0x0808FE1C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_808FEB0, "ax", %progbits
@ sub_808FEB0 @ JP 0x0808FEB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FEB0
	.thumb_func
sub_808FEB0:
	push {r4, r5, lr}
	sub sp, #8
	movs r0, #0
	bl sub_8001ACC
	bl m4aSoundInit
	bl Proc_Init
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _0808FF48 @ =0x03003020
	ldrb r0, [r4, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r0, #0
	strh r0, [r4, #0x38]
	bl FlushLCDControl
	movs r4, #0
	str r4, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r5, _0808FF4C @ =0x01000008
	mov r0, sp
	adds r2, r5, #0
	bl sub_80D636C
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _0808FF50 @ =0x06008000
	adds r2, r5, #0
	bl sub_80D636C
	bl sub_808FE1C
	ldr r0, _0808FF54 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808FF3A
	movs r0, #0x7b
	bl m4aSongNumStart
_0808FF3A:
	ldr r0, _0808FF58 @ =OnMain_SioErrorWait
	bl SetMainUpdateRoutine
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808FF48: .4byte 0x03003020
_0808FF4C: .4byte 0x01000008
_0808FF50: .4byte 0x06008000
_0808FF54: .4byte 0x0202BCEC
_0808FF58: .4byte 0x0808FDF1  @ OnMain_SioErrorWait

