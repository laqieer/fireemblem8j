	.syntax unified
	.set GetUnitExpLevel, 0x0802C28C + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_802C2B0, "ax", %progbits
@ sub_802C2B0 @ JP 0x0802C2B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C2B0
	.thumb_func
sub_802C2B0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl GetUnitExpLevel
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitExpLevel
	subs r5, r5, r0
	movs r0, #0x1f
	subs r5, r0, r5
	cmp r5, #0
	bge _0802C2CE
	movs r5, #0
_0802C2CE:
	ldr r0, [r6, #4]
	movs r1, #0x1a
	ldrsb r1, [r0, r1]
	adds r0, r5, #0
	bl __divsi3
	pop {r4, r5, r6}
	pop {r1}
	bx r1

