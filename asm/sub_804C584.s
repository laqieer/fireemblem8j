	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_804C584, "ax", %progbits
@ sub_804C584 @ JP 0x0804C584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C584
	.thumb_func
sub_804C584:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0804C59C @ =0x0203DA20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804C598
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_0804C598:
	pop {r0}
	bx r0
	.align 2, 0
_0804C59C: .4byte 0x0203DA20

