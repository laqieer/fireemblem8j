	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.ResetIconGraphics, "ax", %progbits
@ ResetIconGraphics @ JP 0x080034D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetIconGraphics
	.thumb_func
ResetIconGraphics:
	push {r4, lr}
	sub sp, #4
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r1, _080034F8 @ =0x02026A90
	ldr r2, _080034FC @ =0x010001C0
	bl sub_80D6370
	mov r0, sp
	adds r0, #2
	strh r4, [r0]
	ldr r1, _08003500 @ =0x02026E10
	ldr r2, _08003504 @ =0x01000010
	bl sub_80D6370
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080034F8: .4byte 0x02026A90
_080034FC: .4byte 0x010001C0
_08003500: .4byte 0x02026E10
_08003504: .4byte 0x01000010

