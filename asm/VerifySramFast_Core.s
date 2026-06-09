	.syntax unified
	.section .text.VerifySramFast_Core, "ax", %progbits
@ VerifySramFast_Core @ JP 0x080D6460 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global VerifySramFast_Core
	.thumb_func
VerifySramFast_Core:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _080D6494 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080D6498 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _080D64A2
	adds r2, r0, #0
_080D6482:
	ldrb r1, [r4]
	ldrb r0, [r5]
	adds r5, #1
	adds r4, #1
	cmp r1, r0
	beq _080D649C
	subs r0, r4, #1
	b _080D64A4
	.align 2, 0
_080D6494: .4byte 0x04000204
_080D6498: .4byte 0x0000FFFC
_080D649C:
	subs r3, #1
	cmp r3, r2
	bne _080D6482
_080D64A2:
	movs r0, #0
_080D64A4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

