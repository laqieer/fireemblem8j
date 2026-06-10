	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_801CC58, "ax", %progbits
@ sub_801CC58 @ JP 0x0801CC58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801CC58
	.thumb_func
sub_801CC58:
	push {lr}
	ldr r2, _0801CC6C @ =0x0203A954
	movs r1, #0
	strb r1, [r2, #0x11]
	movs r1, #2
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0801CC6C: .4byte 0x0203A954

