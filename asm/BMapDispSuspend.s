	.syntax unified
	.set Proc_BlockEachMarked, 0x08002F3C + 1
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.BMapDispSuspend, "ax", %progbits
@ BMapDispSuspend @ JP 0x080300D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BMapDispSuspend
	.thumb_func
BMapDispSuspend:
	push {lr}
	ldr r1, _08030100 @ =0x0202BCAC
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bgt _080300FC
	movs r0, #0
	bl SetSecondaryHBlankHandler
	ldr r1, _08030104 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	movs r0, #1
	bl Proc_BlockEachMarked
_080300FC:
	pop {r0}
	bx r0
	.align 2, 0
_08030100: .4byte 0x0202BCAC
_08030104: .4byte 0x020228A8

