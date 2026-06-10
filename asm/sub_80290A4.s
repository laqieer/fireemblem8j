	.syntax unified
	.set sub_80854E4, 0x080854E4 + 1
	.section .text.sub_80290A4, "ax", %progbits
@ sub_80290A4 @ JP 0x080290A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80290A4
	.thumb_func
sub_80290A4:
	push {lr}
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r1, _080290D4 @ =0x0202E4D8
	ldr r2, [r1]
	lsls r1, r3, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _080290D8
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80854E4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080290D8
	movs r0, #1
	b _080290DA
	.align 2, 0
_080290D4: .4byte 0x0202E4D8
_080290D8:
	movs r0, #0
_080290DA:
	pop {r1}
	bx r1
	.align 2, 0

