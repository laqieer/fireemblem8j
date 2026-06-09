	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set StartPrepUnitSwap, 0x0801E868 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_8033D10, "ax", %progbits
@ sub_8033D10 @ JP 0x08033D10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033D10
	.thumb_func
sub_8033D10:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _08033D4C @ =0x03004DF0
	ldr r5, [r0]
	ldr r6, _08033D50 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r6, r1]
	ldr r1, _08033D54 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0x14
	ldrsh r1, [r6, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	bne _08033D58
	movs r0, #0x14
	ldrsh r2, [r6, r0]
	movs r1, #0x16
	ldrsh r3, [r6, r1]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartPrepUnitSwap
	b _08033D78
	.align 2, 0
_08033D4C: .4byte 0x03004DF0
_08033D50: .4byte 0x0202BCAC
_08033D54: .4byte 0x0202E4D4
_08033D58:
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	adds r0, r7, #0
	adds r1, r5, #0
	bl StartPrepUnitSwap
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	adds r0, r7, #0
	adds r1, r4, #0
	bl StartPrepUnitSwap
_08033D78:
	ldr r0, _08033D90 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08033D8A
	movs r0, #0x61
	bl m4aSongNumStart
_08033D8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08033D90: .4byte 0x0202BCEC

