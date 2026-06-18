	.syntax unified
	.set SlotQueuePush, 0x0800D7EC + 1
	.set sub_800D808, 0x0800D808 + 1
	.section .text.sub_800DBA0, "ax", %progbits
@ Event07_SlotQueueOperations @ JP 0x0800DBA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event07_SlotQueueOperations
	.thumb_func
Event07_SlotQueueOperations:
	push {r4, lr}
	ldr r1, [r0, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	adds r0, r2, #0
	cmp r2, #1
	beq _0800DBD8
	cmp r2, #1
	bgt _0800DBBA
	cmp r2, #0
	beq _0800DBC0
	b _0800DBF8
_0800DBBA:
	cmp r0, #2
	beq _0800DBE8
	b _0800DBF8
_0800DBC0:
	movs r0, #2
	ldrsh r4, [r1, r0]
	ldr r0, _0800DBD4 @ =0x030004B0
	lsls r1, r4, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl SlotQueuePush
	b _0800DBF8
	.align 2, 0
_0800DBD4: .4byte 0x030004B0
_0800DBD8:
	ldr r0, _0800DBE4 @ =0x030004B0
	ldr r0, [r0, #4]
	bl SlotQueuePush
	b _0800DBF8
	.align 2, 0
_0800DBE4: .4byte 0x030004B0
_0800DBE8:
	movs r0, #2
	ldrsh r4, [r1, r0]
	bl sub_800D808
	ldr r2, _0800DC00 @ =0x030004B0
	lsls r1, r4, #2
	adds r1, r1, r2
	str r0, [r1]
_0800DBF8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC00: .4byte 0x030004B0

