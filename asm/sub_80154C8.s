	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80154C8, "ax", %progbits
@ sub_80154C8 @ JP 0x080154C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80154C8
	.thumb_func
sub_80154C8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080154E8 @ =0x085C2F58
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r1, #7
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080154E8: .4byte 0x085C2F58

