	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8009EEC, "ax", %progbits
@ sub_8009EEC @ JP 0x08009EEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009EEC
	.thumb_func
sub_8009EEC:
	push {r4, lr}
	ldr r4, _08009F0C @ =0x085B946C
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
	movs r1, #7
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009F0C: .4byte 0x085B946C

