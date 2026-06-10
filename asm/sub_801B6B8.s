	.syntax unified
	.set FormatTime, 0x08000D14 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_801B6B8, "ax", %progbits
@ sub_801B6B8 @ JP 0x0801B6B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B6B8
	.thumb_func
sub_801B6B8:
	push {r4, lr}
	sub sp, #8
	bl sub_8000CD8
	mov r2, sp
	adds r2, #2
	add r4, sp, #4
	mov r1, sp
	adds r3, r4, #0
	bl FormatTime
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	movs r1, #3
	cmp r0, #0
	bne _0801B6DC
	movs r1, #2
_0801B6DC:
	adds r0, r1, #0
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

