	.syntax unified
	.set sub_8003750, 0x08003750 + 1
	.set sub_80D6A4C, 0x080D6A4C + 1
	.section .text.PrintDebugStringFmtToBG, "ax", %progbits
@ PrintDebugStringFmtToBG @ JP 0x08003798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrintDebugStringFmtToBG
	.thumb_func
PrintDebugStringFmtToBG:
	push {r1, r2, r3}
	push {r4, lr}
	sub sp, #0x100
	adds r4, r0, #0
	ldr r1, [sp, #0x108]
	add r2, sp, #0x10c
	mov r0, sp
	bl sub_80D6A4C
	adds r0, r4, #0
	mov r1, sp
	bl sub_8003750
	add sp, #0x100
	pop {r4}
	pop {r3}
	add sp, #0xc
	bx r3

