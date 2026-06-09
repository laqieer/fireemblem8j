	.syntax unified
	.set CanUnitRescue, 0x08018030 + 1
	.set UnitDrop, 0x08018084 + 1
	.set UnitRescue, 0x08018060 + 1
	.section .text.UnitGive, "ax", %progbits
@ UnitGive @ JP 0x080180DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitGive
	.thumb_func
UnitGive:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0801810C @ =0x085C2A50
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitRescue
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl UnitDrop
	adds r0, r6, #0
	adds r1, r4, #0
	bl UnitRescue
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801810C: .4byte 0x085C2A50

