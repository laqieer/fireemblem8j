	.syntax unified
	.set sub_8002EE8, 0x08002EE8 + 1
	.section .text.Proc_BreakEach, "ax", %progbits
@ Proc_BreakEach @ JP 0x08002FE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_BreakEach
	.thumb_func
Proc_BreakEach:
	push {lr}
	ldr r1, _08002FF0 @ =ClearNativeCallback
	bl sub_8002EE8
	pop {r0}
	bx r0
	.align 2, 0
_08002FF0: .4byte 0x08002FD9  @ ClearNativeCallback

