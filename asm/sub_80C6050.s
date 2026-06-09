	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C6050, "ax", %progbits
@ sub_80C6050 @ JP 0x080C6050 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6050
	.thumb_func
sub_80C6050:
	push {lr}
	ldr r0, _080C6068 @ =0x08AC23F8
	bl CountProcs
	cmp r0, #1
	bgt _080C6062
	ldr r0, _080C606C @ =0x08AC23C0
	bl Proc_EndEach
_080C6062:
	pop {r0}
	bx r0
	.align 2, 0
_080C6068: .4byte 0x08AC23F8
_080C606C: .4byte 0x08AC23C0

