	.syntax unified
	.set ApplyMapChangesById, 0x0802E4C4 + 1
	.section .text.ApplyEnabledMapChanges, "ax", %progbits
@ ApplyEnabledMapChanges @ JP 0x0802E368 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ApplyEnabledMapChanges
	.thumb_func
ApplyEnabledMapChanges:
	push {r4, lr}
	ldr r4, _0802E370 @ =0x0203A610
	b _0802E39A
	.align 2, 0
_0802E370: .4byte 0x0203A610
_0802E374:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0802E380
	cmp r0, #6
	beq _0802E388
	b _0802E398
_0802E380:
	ldrb r0, [r4, #3]
	bl ApplyMapChangesById
	b _0802E398
_0802E388:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802E392
	ldrb r0, [r4, #1]
	b _0802E394
_0802E392:
	ldrb r0, [r4]
_0802E394:
	bl ApplyMapChangesById
_0802E398:
	adds r4, #8
_0802E39A:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E374
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

