	.syntax unified
	.set _write, 0x080DA604 + 1
	.section .text._write_r, "ax", %progbits
@ _write_r @ JP 0x080DA82C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _write_r
	.thumb_func
_write_r:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _080DA858 @ =0x03006798
	movs r3, #0
	str r3, [r4]
	bl _write
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080DA852
	ldr r0, [r4]
	cmp r0, #0
	beq _080DA852
	str r0, [r5]
_080DA852:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080DA858: .4byte 0x03006798

