	.syntax unified
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.section .text.sub_801B13C, "ax", %progbits
@ GenerateUnitStandingReachRange @ JP 0x0801B13C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenerateUnitStandingReachRange
	.thumb_func
GenerateUnitStandingReachRange:
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r5, #0x11
	ldrsb r5, [r2, r5]
	subs r0, r1, #1
	cmp r0, #0x1f
	bls _0801B150
	b _0801B2EC
_0801B150:
	lsls r0, r0, #2
	ldr r1, _0801B15C @ =_0801B160
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B15C: .4byte _0801B160
_0801B160: @ jump table
	.4byte _0801B1E0 @ case 0
	.4byte _0801B1F8 @ case 1
	.4byte _0801B1E8 @ case 2
	.4byte _0801B220 @ case 3
	.4byte _0801B248 @ case 4
	.4byte _0801B20C @ case 5
	.4byte _0801B1F0 @ case 6
	.4byte _0801B2EC @ case 7
	.4byte _0801B2AC @ case 8
	.4byte _0801B2EC @ case 9
	.4byte _0801B2EC @ case 10
	.4byte _0801B234 @ case 11
	.4byte _0801B276 @ case 12
	.4byte _0801B2EC @ case 13
	.4byte _0801B2A4 @ case 14
	.4byte _0801B2EC @ case 15
	.4byte _0801B2EC @ case 16
	.4byte _0801B2EC @ case 17
	.4byte _0801B2EC @ case 18
	.4byte _0801B2EC @ case 19
	.4byte _0801B2EC @ case 20
	.4byte _0801B2EC @ case 21
	.4byte _0801B2EC @ case 22
	.4byte _0801B2EC @ case 23
	.4byte _0801B2EC @ case 24
	.4byte _0801B2EC @ case 25
	.4byte _0801B2EC @ case 26
	.4byte _0801B2EC @ case 27
	.4byte _0801B2EC @ case 28
	.4byte _0801B2EC @ case 29
	.4byte _0801B2EC @ case 30
	.4byte _0801B2C8 @ case 31
_0801B1E0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B2B2
_0801B1E8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B2B2
_0801B1F0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	b _0801B2B2
_0801B1F8:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B2BE
_0801B20C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	b _0801B2BE
_0801B220:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B2BE
_0801B234:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B2BE
_0801B248:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B2BE
_0801B276:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	b _0801B2BE
_0801B2A4:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xa
	b _0801B2B2
_0801B2AC:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
_0801B2B2:
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
_0801B2BE:
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
	b _0801B2EC
_0801B2C8:
	adds r0, r2, #0
	bl sub_8018730
	adds r2, r0, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801B2EC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

