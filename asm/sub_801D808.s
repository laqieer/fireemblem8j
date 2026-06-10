	.syntax unified
	.set GetPhaseAbleUnitCount, 0x08024C9C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_801D808, "ax", %progbits
@ sub_801D808 @ JP 0x0801D808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D808
	.thumb_func
sub_801D808:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0801D834 @ =0x0202BCEC
	adds r0, r1, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	cmp r0, #0
	blt _0801D82C
	ldrb r0, [r1, #0xf]
	bl GetPhaseAbleUnitCount
	cmp r0, #0
	bne _0801D82C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0801D82C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D834: .4byte 0x0202BCEC

