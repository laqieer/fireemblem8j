	.syntax unified
	.set AiRefreshMap, 0x0803A09C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_803E5D0, 0x0803E5D0 + 1
	.section .text.sub_803A6B4, "ax", %progbits
@ sub_803A6B4 @ JP 0x0803A6B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A6B4
	.thumb_func
sub_803A6B4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_803E5D0
	bl AiRefreshMap
	ldr r0, _0803A6E4 @ =0x03004DF0
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _0803A6D4
	ldr r0, [r1, #0xc]
	ldr r1, _0803A6E8 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _0803A6DC
_0803A6D4:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0803A6DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803A6E4: .4byte 0x03004DF0
_0803A6E8: .4byte 0x00010005

