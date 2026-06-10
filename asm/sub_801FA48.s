	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_801FA48, "ax", %progbits
@ sub_801FA48 @ JP 0x0801FA48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FA48
	.thumb_func
sub_801FA48:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0801FA9C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	beq _0801FA6E
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x52
	ldrh r0, [r1]
	cmp r0, #0
	beq _0801FA6A
	adds r1, r4, #0
	adds r1, #0x50
_0801FA6A:
	movs r0, #1
	strh r0, [r1]
_0801FA6E:
	adds r0, r4, #0
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0801FA96
	ldr r2, [r4, #0x14]
	adds r1, r2, #0
	adds r1, #0x50
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _0801FA96
	adds r1, r0, #0
	adds r0, r2, #0
	bl Proc_Goto
	adds r0, r4, #0
	bl Proc_End
_0801FA96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FA9C: .4byte 0x085775CC

