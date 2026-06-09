	.syntax unified
	.set _read, 0x080DA508 + 1
	.section .text._read_r, "ax", %progbits
@ _read_r @ JP 0x080DA970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _read_r
	.thumb_func
_read_r:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _080DA99C @ =0x03006798
	movs r3, #0
	str r3, [r4]
	bl _read
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080DA996
	ldr r0, [r4]
	cmp r0, #0
	beq _080DA996
	str r0, [r5]
_080DA996:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080DA99C: .4byte 0x03006798

