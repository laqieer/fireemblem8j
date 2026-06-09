	.syntax unified
	.section .text.strcpy, "ax", %progbits
@ strcpy @ JP 0x080D69BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global strcpy
	.thumb_func
strcpy:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r3, r6, #0
	adds r2, r1, #0
	adds r0, r2, #0
	orrs r0, r6
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _080D69F4
	ldr r1, [r2]
	ldr r5, _080D69DC @ =0xFEFEFEFF
	adds r0, r1, r5
	bics r0, r1
	ldr r4, _080D69E0 @ =0x80808080
	b _080D69EE
	.align 2, 0
_080D69DC: .4byte 0xFEFEFEFF
_080D69E0: .4byte 0x80808080
_080D69E4:
	ldm r2!, {r0}
	stm r3!, {r0}
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
_080D69EE:
	ands r0, r4
	cmp r0, #0
	beq _080D69E4
_080D69F4:
	ldrb r0, [r2]
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r2, #1
	adds r3, #1
	cmp r0, #0
	bne _080D69F4
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0

