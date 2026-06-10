	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80226C0, "ax", %progbits
@ sub_80226C0 @ JP 0x080226C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80226C0
	.thumb_func
sub_80226C0:
	push {lr}
	ldr r0, _080226E0 @ =0x03004DF0
	movs r1, #0
	str r1, [r0]
	ldr r0, _080226E4 @ =0x0202BCAC
	adds r0, #0x3e
	strb r1, [r0]
	ldr r0, _080226E8 @ =0x085C2F58
	bl Proc_Find
	movs r1, #0xc
	bl Proc_Goto
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_080226E0: .4byte 0x03004DF0
_080226E4: .4byte 0x0202BCAC
_080226E8: .4byte 0x085C2F58

