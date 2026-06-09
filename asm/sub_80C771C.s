	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80C7474, 0x080C7474 + 1
	.section .text.sub_80C771C, "ax", %progbits
@ sub_80C771C @ JP 0x080C771C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C771C
	.thumb_func
sub_80C771C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C7740 @ =0x08AC2608
	bl CountProcs
	cmp r0, #1
	bgt _080C7738
	movs r0, #0
	bl sub_80C7474
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080C7738:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7740: .4byte 0x08AC2608

