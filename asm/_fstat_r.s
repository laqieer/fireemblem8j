	.syntax unified
	.set _fstat, 0x080DA7C4 + 1
	.section .text._fstat_r, "ax", %progbits
@ _fstat_r @ JP 0x080DA8EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _fstat_r
	.thumb_func
_fstat_r:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r4, _080DA914 @ =0x03006798
	movs r2, #0
	str r2, [r4]
	bl _fstat
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080DA910
	ldr r0, [r4]
	cmp r0, #0
	beq _080DA910
	str r0, [r5]
_080DA910:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080DA914: .4byte 0x03006798

