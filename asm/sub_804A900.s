	.syntax unified
	.set BMapVSync_End, 0x080300C4 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_804C140, 0x0804C140 + 1
	.section .text.sub_804A900, "ax", %progbits
@ sub_804A900 @ JP 0x0804A900 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A900
	.thumb_func
sub_804A900:
	push {lr}
	ldr r0, _0804A91C @ =0x085C5DE8
	bl Proc_EndEach
	bl sub_804C140
	bl BMapVSync_End
	movs r0, #1
	bl sub_800226C
	pop {r0}
	bx r0
	.align 2, 0
_0804A91C: .4byte 0x085C5DE8

