	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8085484, "ax", %progbits
@ sub_8085484 @ JP 0x08085484 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085484
	.thumb_func
sub_8085484:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #0x81
_08085494:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080854D0
	ldr r0, [r2]
	cmp r0, #0
	beq _080854D0
	ldr r0, [r2, #0xc]
	ldr r1, _080854CC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080854D0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _080854D0
	cmp r0, r6
	bgt _080854D0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _080854D0
	cmp r0, r5
	bgt _080854D0
	movs r0, #1
	b _080854D8
	.align 2, 0
_080854CC: .4byte 0x00010004
_080854D0:
	adds r4, #1
	cmp r4, #0xbf
	ble _08085494
	movs r0, #0
_080854D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

