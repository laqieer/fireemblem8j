	.syntax unified
	.set _sbrk, 0x080DA788 + 1
	.section .text._sbrk_r, "ax", %progbits
@ _sbrk_r @ JP 0x080DA27C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _sbrk_r
	.thumb_func
_sbrk_r:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _080DA2A4 @ =0x03006798
	movs r1, #0
	str r1, [r4]
	bl _sbrk
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080DA29E
	ldr r0, [r4]
	cmp r0, #0
	beq _080DA29E
	str r0, [r5]
_080DA29E:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_080DA2A4: .4byte 0x03006798

