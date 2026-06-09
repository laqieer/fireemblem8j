	.syntax unified
	.set PutNumber, 0x08004A90 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.section .text.PutNumberOrBlank, "ax", %progbits
@ PutNumberOrBlank @ JP 0x08004A9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutNumberOrBlank
	.thumb_func
PutNumberOrBlank:
	push {lr}
	cmp r2, #0
	blt _08004AA6
	cmp r2, #0xff
	bne _08004AB2
_08004AA6:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _08004AB6
_08004AB2:
	bl PutNumber
_08004AB6:
	pop {r0}
	bx r0
	.align 2, 0

