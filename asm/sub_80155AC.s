	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80155AC, "ax", %progbits
@ sub_80155AC @ JP 0x080155AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80155AC
	.thumb_func
sub_80155AC:
	push {lr}
	ldr r1, _080155D0 @ =0x0202BCEC
	strb r0, [r1, #0xe]
	ldr r0, _080155D4 @ =0x085C2670
	bl Proc_Find
	movs r1, #2
	bl Proc_Goto
	ldr r0, _080155D8 @ =0x085C2F58
	bl Proc_EndEach
	ldr r0, _080155DC @ =0x085D1E10
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080155D0: .4byte 0x0202BCEC
_080155D4: .4byte 0x085C2670
_080155D8: .4byte 0x085C2F58
_080155DC: .4byte 0x085D1E10

