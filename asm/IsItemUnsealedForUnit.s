	.syntax unified
	.section .text.IsItemUnsealedForUnit, "ax", %progbits
@ IsItemUnsealedForUnit @ JP 0x08017254 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsItemUnsealedForUnit
	.thumb_func
IsItemUnsealedForUnit:
	push {lr}
	adds r3, r0, #0
	cmp r1, #0
	bne _08017260
	movs r1, #0xff
	b _08017270
_08017260:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801728C @ =0x0885E068
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08017270:
	ldr r0, _08017290 @ =0x0202BCEC
	adds r0, #0x1c
	adds r0, r1, r0
	ldrb r1, [r0]
	movs r2, #0
	ldr r0, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bne _08017284
	movs r2, #1
_08017284:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0801728C: .4byte 0x0885E068
_08017290: .4byte 0x0202BCEC

