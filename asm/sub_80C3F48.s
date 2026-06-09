	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_80C3F48, "ax", %progbits
@ sub_80C3F48 @ JP 0x080C3F48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3F48
	.thumb_func
sub_80C3F48:
	push {lr}
	ldr r0, _080C3F64 @ =0x08AC1E24
	bl Proc_EndEach
	ldr r0, _080C3F68 @ =0x08AC1E94
	bl Proc_EndEach
	bl SetDefaultColorEffects
	bl sub_804F610
	pop {r0}
	bx r0
	.align 2, 0
_080C3F64: .4byte 0x08AC1E24
_080C3F68: .4byte 0x08AC1E94

