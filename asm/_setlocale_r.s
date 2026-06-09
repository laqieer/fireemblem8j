	.syntax unified
	.set strcmp, 0x080DA36C + 1
	.section .text._setlocale_r, "ax", %progbits
@ _setlocale_r @ JP 0x080D91C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _setlocale_r
	.thumb_func
_setlocale_r:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r4, #0
	beq _080D91FC
	ldr r1, _080D91F0 @ =0x0857747C
	adds r0, r4, #0
	bl strcmp
	cmp r0, #0
	beq _080D91F8
	ldr r1, _080D91F4 @ =0x08577474
	adds r0, r4, #0
	bl strcmp
	cmp r0, #0
	beq _080D91F8
	movs r0, #0
	b _080D91FE
	.align 2, 0
_080D91F0: .4byte 0x0857747C
_080D91F4: .4byte 0x08577474
_080D91F8:
	str r6, [r5, #0x30]
	str r4, [r5, #0x34]
_080D91FC:
	ldr r0, _080D9200 @ =0x0857747C
_080D91FE:
	pop {r4, r5, r6, pc}
	.align 2, 0
_080D9200: .4byte 0x0857747C

