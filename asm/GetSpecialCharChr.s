	.syntax unified
	.set AddSpecialChar, 0x08004998 + 1
	.section .text.GetSpecialCharChr, "ax", %progbits
@ GetSpecialCharChr @ JP 0x080049D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSpecialCharChr
	.thumb_func
GetSpecialCharChr:
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, _080049F0 @ =0x02028E74
_080049DC:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080049F4
	adds r0, r1, #0
	adds r1, r3, #0
	bl AddSpecialChar
	b _08004A0E
	.align 2, 0
_080049F0: .4byte 0x02028E74
_080049F4:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _08004A0A
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08004A0A
	movs r2, #2
	ldrsh r0, [r1, r2]
	b _08004A0E
_08004A0A:
	adds r1, #4
	b _080049DC
_08004A0E:
	pop {r1}
	bx r1
	.align 2, 0

